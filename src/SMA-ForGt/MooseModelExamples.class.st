"
Lazily build a Moose model from an mse file at a known location, and remember it.

[[[
MooseModelExamples argoUML
]]]

"
Class {
	#name : #MooseModelExamples,
	#superclass : #Object,
	#category : #'SMA-ForGt-Moose'
}

{ #category : #accessing }
MooseModelExamples class >> argoUML [
	| modelName modelUrl |
	modelName := 'ArgoUML-0-34'.
	modelUrl := 'https://dl.feenk.com/moose-tutorial/argouml/'.
	^ MooseModel root allModels
		detect: [ :each | each name = modelName ]
		ifNone: [ self buildModelNamed: modelName fromUrl: modelUrl ]
]

{ #category : #accessing }
MooseModelExamples class >> buildModelNamed: modelName fromUrl: archiveUrl [
	| modelFile modelArgo |
	modelFile := FileLocator imageDirectory asFileReference
		/ self modelFolderName / modelName / (modelName , '.mse').
	modelFile exists
		ifFalse: [ self installZipFile: modelName , '.zip' fromUrl: archiveUrl ].
	modelArgo := MooseModel new importMSEFromFile: modelFile.
	MooseModel root add: modelArgo.
	^ modelArgo
]

{ #category : #accessing }
MooseModelExamples class >> installZipFile: archiveFileName fromUrl: archiveUrl [
	| targetFolder |
	targetFolder := (FileLocator imageDirectory asFileReference
		/ self modelFolderName) ensureCreateDirectory.
	ZnClient new
		url: archiveUrl , archiveFileName;
		signalProgress: true;
		downloadTo: targetFolder.
	(ZipArchive new readFrom: targetFolder / archiveFileName)
		extractAllTo: targetFolder
]

{ #category : #accessing }
MooseModelExamples class >> lucene [
	| modelName modelUrl |
	modelName := 'lucene-solr-52f2a77'.
	modelUrl := 'https://dl.feenk.com/moose-tutorial/lucene-solr/'.
	^ MooseModel root allModels
		detect: [ :each | each name = modelName ]
		ifNone: [ self buildModelNamed: modelName fromUrl: modelUrl ]
]

{ #category : #accessing }
MooseModelExamples class >> modelFolderName [
	^ 'models'
]

{ #category : #accessing }
MooseModelExamples class >> weka [
	| modelName modelUrl |
	modelName := 'weka-3-8'.
	modelUrl := 'https://dl.feenk.com/moose-tutorial/weka/'.
	^ MooseModel root allModels
		detect: [ :each | each name = modelName ]
		ifNone: [ self buildModelNamed: modelName fromUrl: modelUrl ]
]
