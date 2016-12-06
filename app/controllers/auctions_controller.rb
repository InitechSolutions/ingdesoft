class AuctionsController < ApplicationController
  impressionist actions: [:show], unique: [:session_hash]
end