class Api::V1::CroupierCore::PitRecordsController < Api::V1::BaseController
    
    def barcodes_for_lookup
     count = params[:count] || 100
     count = 100 if count.to_i > 100
     pit_recs = Domains::CroupierCore::PitRecord.for_lookup(count)
        if pit_recs.any?
            barcodes = pit_recs.map(&:barcode)
            p barcodes
            pit_recs.update_all(capture_status: 4)
            render json: barcodes, status: :ok
        else
            render json: {message: "no available PIT records to lookup"}, status: :ok
        end      
    end

    def resolve_requested_lookups
        begin
            Domains::CroupierCore::UpcItemResolveService.call!(
                product_data_attributes: lookup_params[:attributes],
                unfound_barcodes: lookup_params[:unfound_barcodes]
            )
            render json: {message: "Records resolved successfully!"}, status: :ok
         rescue => e
            render json: {message: e.message }, status: :bad_request
         end
    end


    private


    def lookup_params
        params.require(:product_data).permit(
                { attributes: [:barcode, :title, :brand, :image_url] },
                { unfound_barcodes: []}
        )
    end

end




