require 'nokogiri'
require 'open-uri'

class UrlArticlesController < ApplicationController
  before_action :set_url_article, only: [:show, :edit, :update, :destroy]
  #before_action :set_title_of_url, only: [:show]

  # GET /url_articles
  # GET /url_articles.json
  def index
    @url_articles = UrlArticle.all

  end

  # GET /url_articles/1
  # GET /url_articles/1.json
  def show
    @url = @url_article.source

  end

  # GET /url_articles/new
  def new
    @url_article = UrlArticle.new
  end

  # GET /url_articles/1/edit
  def edit
  end

  # POST /url_articles
  # POST /url_articles.json
  def create
    @url_article = UrlArticle.new(url_article_params)

    #grab title
    @url = @url_article.source
    doc = Nokogiri::HTML(open(@url))

    object = LinkThumbnailer.generate(@url)
    titleText = object.title

    #titleText = doc.title
    @url_article.title = titleText
    #end of grab title

    @url_article.image_source = object.images.first.src.to_s




    respond_to do |format|
      if @url_article.save
        format.html { redirect_to @url_article, notice: 'Url article was successfully created.' }
        format.json { render :show, status: :created, location: @url_article }
      else
        format.html { render :new }
        format.json { render json: @url_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /url_articles/1
  # PATCH/PUT /url_articles/1.json
  def update
    respond_to do |format|
      if @url_article.update(url_article_params)
        format.html { redirect_to @url_article, notice: 'Url article was successfully updated.' }
        format.json { render :show, status: :ok, location: @url_article }
      else
        format.html { render :edit }
        format.json { render json: @url_article.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /url_articles/1
  # DELETE /url_articles/1.json
  def destroy
    @url_article.destroy
    respond_to do |format|
      format.html { redirect_to url_articles_url, notice: 'Url article was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_title_of_url

      @url = @url_article.source
      doc = Nokogiri::HTML(open(@url))

      titleGrab = doc.xpath('//h1')

      @news = doc.xpath('//item').map do |i|
        thumb = i.at_xpath('media:thumbnail').attr('url') if i.at_xpath('media:thumbnail')
        {
          'title' => i.at_xpath('title').text,
          'link' => i.at_xpath('link').text,
          'description' => i.at_xpath('description').text,
          'thumbnail' => thumb
        }
      end


      @url_article.image = @news.thumb

      @url_article.title = titleGrab
    end

    # Use callbacks to share common setup or constraints between actions.
    def set_url_article
      @url_article = UrlArticle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def url_article_params
      params.require(:url_article).permit(:source, :title, :image, :image_source)
    end
end
