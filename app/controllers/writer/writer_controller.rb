class Writer::WriterController < ApplicationController

	before_filter :authenticate_user!

end