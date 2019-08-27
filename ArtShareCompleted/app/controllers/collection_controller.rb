class CollectionsController < ApplicationsController

    # get collection from user
    # localhost:3000/collections/?user_id=(EXAMPLE_USER)

    # to add/destroy artwork to collection/album
    # localhost:3000/collections/collection_id/collect_artwork/?artwork_id=(EXAMPLE_ARTWORK_ID)

    # mirorring user controller? need to pair collection with user
    def index


    end

    def collect_artwork

    end


    private

    def collection_params
        params.require(:collection).permit(:user_id)
    end
end