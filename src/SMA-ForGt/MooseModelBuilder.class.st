Class {
	#name : #MooseModelBuilder,
	#superclass : #Object,
	#category : #'SMA-ForGt-Moose'
}

{ #category : #accessing }
MooseModelBuilder class >> argoUML [
	| modelName modelUrl |
	modelName := 'ArgoUML-0-34'.
	modelUrl := 'https://dl.feenk.com/moose-tutorial/argouml/'.
	^ MooseModel root allModels
		detect: [ :each | each name = modelName ]
		ifNone: [ self installZipFile: modelName , '.zip' fromUrl: modelUrl.
			self buildModelNamed: modelName ]
]

{ #category : #accessing }
MooseModelBuilder class >> buildModelNamed: modelName [
	| modelFile modelArgo |
	modelFile := FileLocator imageDirectory asFileReference / self modelFolderName  
		/ modelName / (modelName , '.mse').
	modelArgo := MooseModel new importMSEFromFile: modelFile.
	MooseModel root add: modelArgo.
	^ modelArgo
]

{ #category : #accessing }
MooseModelBuilder class >> installZipFile: archiveFileName fromUrl: archiveUrl [
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
MooseModelBuilder class >> lucene [
	| modelName modelUrl |
	modelName := 'lucene-solr-52f2a77'.
	modelUrl := 'https://dl.feenk.com/moose-tutorial/lucene-solr/'.
	^ MooseModel root allModels
		detect: [ :each | each name = modelName ]
		ifNone: [ self installZipFile: modelName , '.zip' fromUrl: modelUrl.
			self buildModelNamed: modelName ]
]

{ #category : #accessing }
MooseModelBuilder class >> modelFolderName [
	^ 'models'
]
