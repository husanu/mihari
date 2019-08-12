# frozen_string_literal: true

RSpec.describe Mihari::CLI do
  subject { described_class }

  let(:query) { "test" }
  let(:mock) { double("Analyzer") }

  before { allow(mock).to receive(:run) }

  describe "#censys" do
    before { allow(Mihari::Analyzers::Censys).to receive(:new).and_return(mock) }

    it do
      subject.start ["censys", query]
      expect(mock).to have_received(:run).once
    end
  end

  describe "#shodan" do
    before { allow(Mihari::Analyzers::Shodan).to receive(:new).and_return(mock) }

    it do
      subject.start ["shodan", query]
      expect(mock).to have_received(:run).once
    end
  end

  describe "#onyphe" do
    before { allow(Mihari::Analyzers::Onyphe).to receive(:new).and_return(mock) }

    it do
      subject.start ["onyphe", query]
      expect(mock).to have_received(:run).once
    end
  end

  describe "#urlscan" do
    before { allow(Mihari::Analyzers::Urlscan).to receive(:new).and_return(mock) }

    it do
      subject.start ["urlscan", query]
      expect(mock).to have_received(:run).once
    end
  end

  describe "#alerts" do
    let(:mock) { double("AlertViewer") }

    before do
      allow(Mihari::AlertViewer).to receive(:new).and_return(mock)
      allow(mock).to receive(:list)
    end

    it do
      subject.start ["alerts"]
      expect(mock).to have_received(:list).once
    end
  end
end