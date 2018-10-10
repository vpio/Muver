import ReactOnRails from 'react-on-rails';

import Map from '../bundles/Map/components/Map';
import Listings from '../bundles/Listings/components/Listings';

// This is how react_on_rails can see stuff in the browser.
ReactOnRails.register({
  Map,
  Listings,
});
