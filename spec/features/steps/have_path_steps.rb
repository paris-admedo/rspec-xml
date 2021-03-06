steps_for :have_path do
  step 'there is a string of XML' do
    @xml = lambda { |insides| "<xml>#{insides}</xml>" }
  end

  step 'the :node_name node contains the text: :text' do |node_name, text|
    @xml = @xml.call "<#{node_name}>#{text}</#{node_name}>"
  end

  step 'I test for the text: :text within the :node_name node' do |text, node_name|
    @test = lambda { expect(@xml).to have_xpath("//#{node_name}").with_text(text) }
  end

  step 'the :node_name node contains the attribute :key with value: :value' do |node_name, key, value|
    @xml = @xml.call "<#{node_name} #{key}=\"#{value}\"></#{node_name}>"
  end

  step 'I test for the attribute: :key to be :value within the :node_name node' do |key, value, node_name|
    @test = lambda { expect(@xml).to have_xpath("//#{node_name}").with_attr({key => value}) }
  end

  step 'the test should pass' do
    expect(@test).not_to raise_error
  end

  step 'the test should fail' do
    expect(@test).to raise_error(RSpec::Expectations::ExpectationNotMetError)
  end

end
