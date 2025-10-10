module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    settings index: {
      max_ngram_diff: 18,
      analysis: {
        analyzer: {
          edge_ngram_analyzer: {
            tokenizer: 'edge_ngram_tokenizer',
            filter: ['lowercase']
          },
          search_analyzer: {
            tokenizer: 'standard',
            filter: ['lowercase']
          }
        },
        tokenizer: {
          edge_ngram_tokenizer: {
            type: 'edge_ngram',
            min_gram: 1,
            max_gram: 20,
            token_chars: ['letter', 'digit']
          }
        }
      }
    }

    def as_indexed_json(_options = {})
      as_json(only: self.class.searchable_fields).merge(type: self.class.name)
    end
  end



  class_methods do
    def define_search_mappings!
      model_class = self 
      mappings dynamic: false do
        model_class.searchable_fields.each do |field|
          indexes field, type: :text, analyzer: 'edge_ngram_analyzer', search_analyzer: 'search_analyzer'
        end
      end
    end
  end
end
