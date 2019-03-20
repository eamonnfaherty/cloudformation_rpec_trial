FROM ruby:2.3.1

RUN mkdir /specs

WORKDIR /specs

RUN gem install cloudformation_rspec

COPY vpc_spec.rb /specs/ 

ENTRYPOINT ["rspec"]

CMD ["vpc_spec.rb"]


