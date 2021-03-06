
describe 'hx-titlebar', ->

  beforeEach ->
    fixture = hx.select('body').append('div').attr('id', 'fixture').html """
      <div class="hx-heading">
        <div class="hx-titlebar">
          <div class="hx-titlebar-container">
            <div class="hx-titlebar-header">
              <a class="hx-titlebar-icon" href="#"><img class="hx-titlebar-icon-ocado-dots"></img></a>
              <div class="hx-titlebar-title">Title</div>
              <div class="hx-titlebar-subtitle">Subtitle</div>
              <div class="hx-titlebar-menu-icon-mobile"><i class="fa fa-reorder"></i></div>
            </div>
            <div class="hx-titlebar-menu-icons">
              <div class="hx-titlebar-menu-icons-container">
                <a class="hx-titlebar-menu-icon"><i class="fa fa-tags"></i><span class="hx-titlebar-menu-text">Tags</span></a>
                <a class="hx-titlebar-menu-icon"><i class="fa fa-life-ring"></i><span class="hx-titlebar-menu-text">Help</span></a>
                <a class="hx-titlebar-menu-icon"><i class="fa fa-cog"></i><span class="hx-titlebar-menu-text">Settings</span></a>
                <a class="hx-titlebar-menu-icon"><i class="fa fa-power-off"></i><span class="hx-titlebar-menu-text">Sign out</span></a>
              </div>
            </div>
          </div>
        </div>
        <div class="hx-titlebar-linkbar">
          <div class="hx-titlebar-contents">
            <a id="link-1" class="hx-titlebar-link">Link 1</a>
            <a id="link-2" class="hx-titlebar-link">Link 2</a>
            <a id="link-3" class="hx-titlebar-link">Link 3</a>
            <a id="link-4" class="hx-titlebar-link">Link 4</a>
            <a id="link-5" class="hx-titlebar-link">Link 5</a>
          </div>
        </div>
      </div>
    """

    hx.select('#fixture').selectAll('span').style('display', 'block').style('display')
    hx.select('#fixture').select('span').style('display', 'inline-block').style('display')

    spyOn(console, 'warn')

  afterEach ->
    hx.select('#fixture').remove()


  it 'should set the active section by index correctly', ->
    titlebar = new hx.TitleBar(hx.select('#fixture').select('.hx-heading').node())
    titlebar.active(0)
    expect(hx.selectAll('.hx-titlebar-link').classed('hx-selected')).toEqual([true, false, false, false, false])

  it 'should set the active section by index correctly', ->
    titlebar = new hx.TitleBar(hx.select('#fixture').select('.hx-heading').node())
    titlebar.active(4)
    expect(hx.selectAll('.hx-titlebar-link').classed('hx-selected')).toEqual([false, false, false, false, true])

  it 'should set the active section by index correctly when out of range', ->
    titlebar = new hx.TitleBar(hx.select('#fixture').select('.hx-heading').node())
    titlebar.active(5)
    expect(hx.selectAll('.hx-titlebar-link').classed('hx-selected')).toEqual([false, false, false, false, false])

  it 'should set the active section by index correctly', ->
    titlebar = new hx.TitleBar(hx.select('#fixture').select('.hx-heading').node())
    titlebar.active('#link-1')
    expect(hx.selectAll('.hx-titlebar-link').classed('hx-selected')).toEqual([true, false, false, false, false])

  it 'should set the active section by index correctly', ->
    titlebar = new hx.TitleBar(hx.select('#fixture').select('.hx-heading').node())
    titlebar.active('#link-5')
    expect(hx.selectAll('.hx-titlebar-link').classed('hx-selected')).toEqual([false, false, false, false, true])

  it 'should set the active section by index correctly', ->
    titlebar = new hx.TitleBar(hx.select('#fixture').select('.hx-heading').node())
    titlebar.active('#link-6')
    expect(hx.selectAll('.hx-titlebar-link').classed('hx-selected')).toEqual([false, false, false, false, false])

  it 'should reset the active section correctly', ->
    titlebar = new hx.TitleBar(hx.select('#fixture').select('.hx-heading').node())
    titlebar.active(0)
    expect(hx.selectAll('.hx-titlebar-link').classed('hx-selected')).toEqual([true, false, false, false, false])
    titlebar.active(undefined)
    expect(hx.selectAll('.hx-titlebar-link').classed('hx-selected')).toEqual([false, false, false, false, false])
