
module Searchable
  extend ActiveSupport::Concern

  included do
    include Elasticsearch::Model
    include Elasticsearch::Model::Callbacks

    index_name "shared_search_index"

    settings index: {
      max_ngram_diff: 18,
      analysis: {
        analyzer: {
          ngram_analyzer: {
            tokenizer: 'ngram_tokenizer',
            filter: ['lowercase']
          },
          ngram_search_analyzer: {
            tokenizer: 'lowercase'
          }
        },
        tokenizer: {
          ngram_tokenizer: {
            type: 'ngram',
            min_gram: 2,
            max_gram: 20,
            token_chars: ['letter', 'digit', 'whitespace']
          }
        }
      }
    }

    def self.searchable_fields
      %w[name description] 
    end

    klass = self
    mappings dynamic: false do
      klass.searchable_fields.each do |field|
        indexes field, type: :text, analyzer: 'ngram_analyzer', search_analyzer: 'ngram_search_analyzer'
      end
      indexes :type, type: :keyword
    end

    def as_indexed_json(options = {})
      self.as_json(only: self.class.searchable_fields).merge(type: self.class.name)
    end
  end
end
