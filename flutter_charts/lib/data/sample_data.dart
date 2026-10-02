/// Datasets compartidos por las gráficas. Un dataset por tema.
const salesByGenre = [
  {'genre': 'Sports', 'sold': 275},
  {'genre': 'Strategy', 'sold': 115},
  {'genre': 'Action', 'sold': 120},
  {'genre': 'Shooter', 'sold': 350},
  {'genre': 'Other', 'sold': 150},
];

const monthlySales = [
  {'month': 'Jan', 'value': 42},
  {'month': 'Feb', 'value': 58},
  {'month': 'Mar', 'value': 51},
  {'month': 'Apr', 'value': 76},
  {'month': 'May', 'value': 69},
  {'month': 'Jun', 'value': 88},
  {'month': 'Jul', 'value': 82},
  {'month': 'Aug', 'value': 96},
  {'month': 'Sep', 'value': 91},
  {'month': 'Oct', 'value': 108},
  {'month': 'Nov', 'value': 116},
  {'month': 'Dec', 'value': 128},
];

const weeklyTraffic = [
  {'day': 'Mon', 'value': 120},
  {'day': 'Tue', 'value': 154},
  {'day': 'Wed', 'value': 132},
  {'day': 'Thu', 'value': 188},
  {'day': 'Fri', 'value': 214},
  {'day': 'Sat', 'value': 176},
  {'day': 'Sun', 'value': 142},
];

const regionalSales = [
  {'region': 'North', 'value': 72},
  {'region': 'South', 'value': 54},
  {'region': 'East', 'value': 86},
  {'region': 'West', 'value': 64},
];

const quarterlySeries = [
  {'quarter': 'Q1', 'value': 38},
  {'quarter': 'Q2', 'value': 62},
  {'quarter': 'Q3', 'value': 54},
  {'quarter': 'Q4', 'value': 88},
];

const groupedSales = [
  {'genre': 'Sports', 'channel': 'Online', 'value': 180},
  {'genre': 'Sports', 'channel': 'Store', 'value': 95},
  {'genre': 'Strategy', 'channel': 'Online', 'value': 90},
  {'genre': 'Strategy', 'channel': 'Store', 'value': 55},
  {'genre': 'Action', 'channel': 'Online', 'value': 140},
  {'genre': 'Action', 'channel': 'Store', 'value': 105},
  {'genre': 'Shooter', 'channel': 'Online', 'value': 220},
  {'genre': 'Shooter', 'channel': 'Store', 'value': 130},
];

const stackedSales = [
  {'genre': 'Sports', 'channel': 'New', 'value': 170},
  {'genre': 'Sports', 'channel': 'Returning', 'value': 105},
  {'genre': 'Strategy', 'channel': 'New', 'value': 80},
  {'genre': 'Strategy', 'channel': 'Returning', 'value': 45},
  {'genre': 'Action', 'channel': 'New', 'value': 135},
  {'genre': 'Action', 'channel': 'Returning', 'value': 90},
  {'genre': 'Shooter', 'channel': 'New', 'value': 210},
  {'genre': 'Shooter', 'channel': 'Returning', 'value': 140},
];

const intervalData = [
  {'period': 'Q1', 'min': 18, 'max': 62},
  {'period': 'Q2', 'min': 35, 'max': 84},
  {'period': 'Q3', 'min': 28, 'max': 73},
  {'period': 'Q4', 'min': 48, 'max': 96},
];

const funnelData = [
  {'step': 'Visits', 'value': 1000},
  {'step': 'Sign ups', 'value': 720},
  {'step': 'Trials', 'value': 440},
  {'step': 'Paid', 'value': 230},
  {'step': 'Renewed', 'value': 150},
];

const multiSeries = [
  {'month': 'Jan', 'series': 'Actual', 'value': 42},
  {'month': 'Feb', 'series': 'Actual', 'value': 58},
  {'month': 'Mar', 'series': 'Actual', 'value': 51},
  {'month': 'Apr', 'series': 'Actual', 'value': 76},
  {'month': 'Jan', 'series': 'Target', 'value': 48},
  {'month': 'Feb', 'series': 'Target', 'value': 55},
  {'month': 'Mar', 'series': 'Target', 'value': 63},
  {'month': 'Apr', 'series': 'Target', 'value': 70},
];

const cumulativeSales = [
  {'month': 'Jan', 'value': 42},
  {'month': 'Feb', 'value': 100},
  {'month': 'Mar', 'value': 151},
  {'month': 'Apr', 'value': 227},
  {'month': 'May', 'value': 296},
  {'month': 'Jun', 'value': 384},
];

const indexedSales = [
  {'month': 'Jan', 'series': 'Product A', 'value': 100},
  {'month': 'Feb', 'series': 'Product A', 'value': 112},
  {'month': 'Mar', 'series': 'Product A', 'value': 108},
  {'month': 'Apr', 'series': 'Product A', 'value': 126},
  {'month': 'Jan', 'series': 'Product B', 'value': 100},
  {'month': 'Feb', 'series': 'Product B', 'value': 96},
  {'month': 'Mar', 'series': 'Product B', 'value': 118},
  {'month': 'Apr', 'series': 'Product B', 'value': 133},
];

const growthSales = [
  {'month': 'Jan', 'value': 0},
  {'month': 'Feb', 'value': 18},
  {'month': 'Mar', 'value': -12},
  {'month': 'Apr', 'value': 49},
  {'month': 'May', 'value': -9},
  {'month': 'Jun', 'value': 27},
];

const confidenceData = [
  {'month': 'Jan', 'estimate': 42, 'lower': 32, 'upper': 52},
  {'month': 'Feb', 'estimate': 58, 'lower': 46, 'upper': 69},
  {'month': 'Mar', 'estimate': 51, 'lower': 41, 'upper': 63},
  {'month': 'Apr', 'estimate': 76, 'lower': 64, 'upper': 88},
  {'month': 'May', 'estimate': 69, 'lower': 57, 'upper': 80},
];

const divergentData = [
  {'month': 'Jan', 'positive': 42, 'negative': -18},
  {'month': 'Feb', 'positive': 58, 'negative': -12},
  {'month': 'Mar', 'positive': 51, 'negative': -25},
  {'month': 'Apr', 'positive': 76, 'negative': -31},
  {'month': 'May', 'positive': 69, 'negative': -22},
];

const scatterData = [
  {'x': 12, 'y': 28, 'group': 'A', 'weight': 5},
  {'x': 18, 'y': 34, 'group': 'A', 'weight': 7},
  {'x': 25, 'y': 41, 'group': 'A', 'weight': 10},
  {'x': 31, 'y': 38, 'group': 'B', 'weight': 6},
  {'x': 39, 'y': 52, 'group': 'B', 'weight': 12},
  {'x': 47, 'y': 61, 'group': 'B', 'weight': 16},
  {'x': 54, 'y': 48, 'group': 'C', 'weight': 9},
  {'x': 62, 'y': 73, 'group': 'C', 'weight': 14},
];

const stripData = [
  {'category': 'Low', 'value': 22},
  {'category': 'Low', 'value': 28},
  {'category': 'Low', 'value': 31},
  {'category': 'Mid', 'value': 42},
  {'category': 'Mid', 'value': 48},
  {'category': 'Mid', 'value': 55},
  {'category': 'High', 'value': 68},
  {'category': 'High', 'value': 74},
  {'category': 'High', 'value': 82},
];

const matrixData = [
  {'x': 'Mon', 'y': 'AM', 'value': 18},
  {'x': 'Mon', 'y': 'PM', 'value': 32},
  {'x': 'Tue', 'y': 'AM', 'value': 24},
  {'x': 'Tue', 'y': 'PM', 'value': 45},
  {'x': 'Wed', 'y': 'AM', 'value': 29},
  {'x': 'Wed', 'y': 'PM', 'value': 38},
  {'x': 'Thu', 'y': 'AM', 'value': 34},
  {'x': 'Thu', 'y': 'PM', 'value': 52},
];

const histogramBins = [
  {'bin': '0-20', 'count': 4},
  {'bin': '20-40', 'count': 11},
  {'bin': '40-60', 'count': 18},
  {'bin': '60-80', 'count': 13},
  {'bin': '80-100', 'count': 7},
];

const paretoData = [
  {'category': 'A', 'count': 42, 'cumulative': 42},
  {'category': 'B', 'count': 30, 'cumulative': 72},
  {'category': 'C', 'count': 18, 'cumulative': 90},
  {'category': 'D', 'count': 10, 'cumulative': 100},
];

const radarData = [
  {'axis': 'Speed', 'value': 78},
  {'axis': 'Power', 'value': 64},
  {'axis': 'Range', 'value': 86},
  {'axis': 'Control', 'value': 59},
  {'axis': 'Value', 'value': 72},
];
