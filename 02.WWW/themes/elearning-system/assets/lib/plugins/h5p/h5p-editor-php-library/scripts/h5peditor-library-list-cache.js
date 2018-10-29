/** @namespace H5PEditor */
var H5PEditor = H5PEditor || {};

/**
 * The library list cache
 *
 * @type Object
 */
var llc = H5PEditor.LibraryListCache = {
  libraryCache: {},
  librariesComingIn: {},
  librariesMissing: {},
  que: []
};

/**
 * Get data for a list of libraries
 *
 * @param {Array} libraries - list of libraries to load info for (uber names)
 * @param {Function} handler - Callback when list of libraries is loaded
 * @param {Function} thisArg - Context for the callback function
 */
llc.getLibraries = function(libraries, handler, thisArg) {
  var cachedLibraries = [];
  var status = 'hasAll';
  for (var i = 0; i < libraries.length; i++) {
    if (libraries[i] in llc.libraryCache) {
      // Libraries that are missing on the server are set to null...
      if (llc.libraryCache[libraries[i]] !== null) {
        cachedLibraries.push(llc.libraryCache[libraries[i]]);
      }
    }
    else if (libraries[i] in llc.librariesComingIn) {
      if (status === 'hasAll') {
        status = 'onTheWay';
      }
    }
    else {
      status = 'requestThem';
      llc.librariesComingIn[libraries[i]] = true;
    }
  }
  switch (status) {
    case 'hasAll':
      handler.call(thisArg, cachedLibraries);
      break;
  case 'onTheWay':
    llc.que.push({libraries: libraries, handler: handler, thisArg: thisArg});
    break;
  case 'requestThem':

    var ajaxParams = {
      type: "POST",
      url: H5PEditor.getAjaxUrl('libraries'),
      success: function(data) {
          console.log(JSON.stringify(data));
          llc.setLibraries(data, libraries);
          handler.call(thisArg, data);
          llc.runQue();
      },
      data: {
        'libraries': libraries
      },
      dataType: "json"
    };
    // var data = null;
    //   console.log(H5PEditor.getAjaxUrl('libraries'));
    if (libraries[0] == 'H5P.Summary 1.9')
    {
         data = [{"uberName":"H5P.Summary 1.9","name":"H5P.Summary","majorVersion":"1","minorVersion":"9","tutorialUrl":"","title":"Summary","runnable":"1","restricted":false}];

    }
    else
    {
         data = [
             {
                 "uberName": "H5P.Nil 1.0",
                 "name": "H5P.Nil",
                 "majorVersion": "1",
                 "minorVersion": "0",
                 "tutorialUrl": "",
                 "title": "Nil",
                 "runnable": "0",
                 "restricted": false
             },
             {
                 "uberName": "H5P.Text 1.1",
                 "name": "H5P.Text",
                 "majorVersion": "1",
                 "minorVersion": "1",
                 "tutorialUrl": "",
                 "title": "Text",
                 "runnable": "0",
                 "restricted": false
             },
             {
                 "uberName": "H5P.Table 1.1",
                 "name": "H5P.Table",
                 "majorVersion": "1",
                 "minorVersion": "1",
                 "tutorialUrl": "",
                 "title": "Table",
                 "runnable": "0",
                 "restricted": false
             },
             {
                 "uberName": "H5P.Link 1.3",
                 "name": "H5P.Link",
                 "majorVersion": "1",
                 "minorVersion": "3",
                 "tutorialUrl": "",
                 "title": "Link",
                 "runnable": "0",
                 "restricted": false
             },
             {
                 "uberName": "H5P.Image 1.0",
                 "name": "H5P.Image",
                 "majorVersion": "1",
                 "minorVersion": "0",
                 "tutorialUrl": "",
                 "title": "Image",
                 "runnable": "0",
                 "restricted": false
             },
             {
                 "uberName": "H5P.Summary 1.9",
                 "name": "H5P.Summary",
                 "majorVersion": "1",
                 "minorVersion": "9",
                 "tutorialUrl": "",
                 "title": "Summary",
                 "runnable": "1",
                 "restricted": false
             },
             {
                 "uberName": "H5P.SingleChoiceSet 1.10",
                 "name": "H5P.SingleChoiceSet",
                 "majorVersion": "1",
                 "minorVersion": "10",
                 "tutorialUrl": "",
                 "title": "Single Choice Set",
                 "runnable": "1",
                 "restricted": false
             },
             {
                 "uberName": "H5P.MultiChoice 1.12",
                 "name": "H5P.MultiChoice",
                 "majorVersion": "1",
                 "minorVersion": "12",
                 "tutorialUrl": "",
                 "title": "Multiple Choice",
                 "runnable": "1",
                 "restricted": false
             },
             {
                 "uberName": "H5P.TrueFalse 1.4",
                 "name": "H5P.TrueFalse",
                 "majorVersion": "1",
                 "minorVersion": "4",
                 "tutorialUrl": "",
                 "title": "True/False Question",
                 "runnable": "1",
                 "restricted": false
             },
             {
                 "uberName": "H5P.Blanks 1.10",
                 "name": "H5P.Blanks",
                 "majorVersion": "1",
                 "minorVersion": "10",
                 "tutorialUrl": "",
                 "title": "Fill in the Blanks",
                 "runnable": "1",
                 "restricted": false
             },
             {
                 "uberName": "H5P.DragQuestion 1.12",
                 "name": "H5P.DragQuestion",
                 "majorVersion": "1",
                 "minorVersion": "12",
                 "tutorialUrl": "",
                 "title": "Drag and Drop",
                 "runnable": "1",
                 "restricted": false
             },
             {
                 "uberName": "H5P.MarkTheWords 1.8",
                 "name": "H5P.MarkTheWords",
                 "majorVersion": "1",
                 "minorVersion": "8",
                 "tutorialUrl": "",
                 "title": "Mark the Words",
                 "runnable": "1",
                 "restricted": false
             },
             {
                 "uberName": "H5P.DragText 1.7",
                 "name": "H5P.DragText",
                 "majorVersion": "1",
                 "minorVersion": "7",
                 "tutorialUrl": "",
                 "title": "Drag Text",
                 "runnable": "1",
                 "restricted": false
             },
             {
                 "uberName": "H5P.GoToQuestion 1.3",
                 "name": "H5P.GoToQuestion",
                 "majorVersion": "1",
                 "minorVersion": "3",
                 "tutorialUrl": "",
                 "title": "Crossroads",
                 "runnable": "0",
                 "restricted": false
             },
             {
                 "uberName": "H5P.IVHotspot 1.2",
                 "name": "H5P.IVHotspot",
                 "majorVersion": "1",
                 "minorVersion": "2",
                 "tutorialUrl": "",
                 "title": "Navigation Hotspot",
                 "runnable": "0",
                 "restricted": false
             },
             {
                 "uberName": "H5P.Questionnaire 1.2",
                 "name": "H5P.Questionnaire",
                 "majorVersion": "1",
                 "minorVersion": "2",
                 "tutorialUrl": "",
                 "title": "Questionnaire",
                 "runnable": "1",
                 "restricted": true
             },
             {
                 "uberName": "H5P.FreeTextQuestion 1.0",
                 "name": "H5P.FreeTextQuestion",
                 "majorVersion": "1",
                 "minorVersion": "0",
                 "tutorialUrl": "",
                 "title": "Free Text Question",
                 "runnable": "0",
                 "restricted": true
             }
         ];
    }

      llc.setLibraries(data, libraries);
      handler.call(thisArg, data);
      llc.runQue();
   // H5PEditor.$.ajax(ajaxParams);
    break;
  }
};

/**
 * Call all qued handlers
 */
llc.runQue = function() {
  var l = llc.que.length;
  for (var i = 0; i < l; i++) {
    var handlerObject = llc.que.shift();
    llc.getLibraries(handlerObject.libraries, handlerObject.handler, handlerObject.thisArg);
  }
};

/**
 * We've got new libraries from the server, save them
 *
 * @param {Array} libraries - Libraries with info from server
 * @param {Array} requestedLibraries - List of what libraries we requested
 */
llc.setLibraries = function(libraries, requestedLibraries) {
  var reqLibraries = requestedLibraries.slice();
  for (var i = 0; i < libraries.length; i++) {
    llc.libraryCache[libraries[i].uberName] = libraries[i];
    if (libraries[i].uberName in llc.librariesComingIn) {
      delete llc.librariesComingIn[libraries[i].uberName];
    }
    var index = reqLibraries.indexOf(libraries[i].uberName);
    if (index > -1) {
      reqLibraries.splice(index, 1);
    }
  }
  for (var i = 0; i < reqLibraries.length; i++) {
    llc.libraryCache[reqLibraries[i]] = null;
    if (reqLibraries[i] in llc.librariesComingIn) {
      delete llc.librariesComingIn[libraries[i]];
    }
  }
};
