class MarketplaceController < ApplicationController
  # TODO: FIGURE OUT IF PUTTING THIS HERE IS SAFE, CSRF?
  protect_from_forgery

  def index   # display all items
    json = DummyController.marketplace_json
    response = {}
    response['verb'] = 'GET'
    response['route'] = ''
    response['status'] = 'OK'
    response['header'] = json['header']
    response['projects'] = json['projects']
    response['bundles'] = json['bundles']
    response['applications'] = json['applications']
    response['solutions'] = json['solutions']
    response['marketplaceValues'] = json['marketplace_values']
    response['services'] = json['services']
    response['html'] = json['html']
    render json: response.to_json
  end
end