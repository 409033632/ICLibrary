ICLibrary
=========

an iOS library built on Cocoa and UIKit, include Network、UI、Caategory and Animation four parts;


Network
=========



UI
=========
Introduction to the use of commonly used controls

//ICZoomableImageView
eg：

    ICZoomableImageView *zoomableImageView = [[ICZoomableImageView alloc] initwithImage:[UIImage imageNamed:@"test.jpg"] frame:self.view.bounds];
    zoomableImageView.zoomableImageDelegate = self;
    [self.view addSubview:zoomableImageView];
    [zoomableImageView release];


Category
=========


Animation
=========




