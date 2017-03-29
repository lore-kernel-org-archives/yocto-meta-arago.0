Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id ED7C65297D
	for <meta-arago@arago-project.org>;
	Wed, 29 Mar 2017 14:07:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2TE7RsC025658
	for <meta-arago@arago-project.org>; Wed, 29 Mar 2017 09:07:27 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1490796447;
	bh=MKHaGSl7/Y+U5Pis6fq37sJXCZWrnvkWGslmpUNAyhA=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=BqCVclr3sneiP6Mji930zbFTgB5RjWA5vz110DAjyT57X7Rs3ljXVUUQgQXh0Zomt
	CKu2Wao41Xrc8sK937FStNBn0/s07yukM5MtyQCVC2O4W21tL6vRDMFEnKdmwGLYii
	DEQLjUjNaPA6BOOFHsaRBfUug9J8M4M0PjOQZH5w=
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2TE7ReV029914
	for <meta-arago@arago-project.org>; Wed, 29 Mar 2017 09:07:27 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 29 Mar 2017 09:07:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2TE7RIJ004037;
	Wed, 29 Mar 2017 09:07:27 -0500
Date: Wed, 29 Mar 2017 10:07:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Senicic, Djordje" <d-senicic1@ti.com>
Message-ID: <20170329140726.GA11364@edge>
References: <1489779474-16764-1-git-send-email-h-gou@ti.com>
	<20170320181458.GA23524@edge>
	<2E957F12D11D904590FA9AF86D366BD926CF81ED@DLEE08.ent.ti.com>
	<F14615FE38B0C8438A0E39BF946F6E781B10696E@DLEE12.ent.ti.com>
	<20170328225653.GR29187@edge>
	<F14615FE38B0C8438A0E39BF946F6E781B107D53@DLEE12.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <F14615FE38B0C8438A0E39BF946F6E781B107D53@DLEE12.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [morty/krogoth][PATCH 1/4] voxelsdk: add version 0.6.8
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Wed, 29 Mar 2017 14:07:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Thanks.

It appears the industry is indeed slowly migrating to python3 as a default. 
E.g. Ubuntu 16.04 and later by default only installs python3. You can still 
install 2.7 manually, if needed, but that will probably be dopped eventually.

-- 
Denys


On Wed, Mar 29, 2017 at 07:50:37AM -0400, Senicic, Djordje wrote:
> Based on below responses, regarding voxelsdk, it is not likely Python2.7 
> support will be abandoned soon.
> I would (in general) consent with observation that python2.7 vs 3.5+ 
> dichotomy is not going to end in near future.
> ===
> From: Gadiyar, Anand 
> Sent: Wednesday, March 29, 2017 5:11 AM
> To: Li, Larry; Senicic, Djordje
> Subject: RE: TOF python 3.5+ support
> 
> No plans for Python 3 support at this time.
> 
> Not much is needed to enable Python 3 I think as SWIG should be able to take 
> care of it out of the box. However we do not have any active development on 
> the SDK, so we will not be testing.
> If someone puts together a patch to enable Python 3 support, we will be 
> happy to take it.
> 
> 
> We require Python 2.7 to work mainly because our other development tools and 
> VoxelViewer are still using Python 2.7.
> ===
> From: Li, Larry 
> Sent: Wednesday, March 29, 2017 4:55 AM
> To: Senicic, Djordje
> Cc: Gadiyar, Anand
> Subject: Re: TOF python 3.5+ support
> 
> Python 3 cannot run Python 2.7 scripts in many cases. Is the industry as a 
> whole ready to move to Python 3 only?  What is the Python support plan for 
> most major Linux distros?  If they continue to support both people won't 
> migrate their existing app.  Python 2.7 is still the default in most 
> distros.
> 
> Larry
> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Tuesday, March 28, 2017 6:57 PM
> To: Senicic, Djordje
> Cc: Gou, Hongmei; meta-arago@arago-project.org
> Subject: Re: [meta-arago] [morty/krogoth][PATCH 1/4] voxelsdk: add version 0.6.8
> 
> On Tue, Mar 21, 2017 at 11:32:50AM -0400, Senicic, Djordje wrote:
> > AFAIK, there is no immediate plan to support Python 3+.
> > Initiative for that may come from Larry Li (TOF SW Arch). I'll check w/ him.
> > Not feasible for PLSDK3.3, but 2Q (if he agrees) that is likely.
> 
> Thanks! That would be helpful. Currently we have to package both python2.7 and
> python3 in the rootfs, because different components use different versions. 
> Would be nice to align everything on one version to save space. Please keep me posted on this activity, thanks.
> 
> --
> Denys
> 
> 
> > -----Original Message-----
> > From: Gou, Hongmei 
> > Sent: Tuesday, March 21, 2017 11:11 AM
> > To: Dmytriyenko, Denys; Senicic, Djordje
> > Cc: meta-arago@arago-project.org
> > Subject: RE: [meta-arago] [morty/krogoth][PATCH 1/4] voxelsdk: add version 0.6.8
> > 
> > v2 patch is submitted.
> > 
> > Djordje, can you please comment on the plan to use python3 instead of 2.7?
> > 
> > Thanks,
> > Hongmei
> > 
> > > -----Original Message-----
> > > From: Dmytriyenko, Denys
> > > Sent: Monday, March 20, 2017 2:15 PM
> > > To: Gou, Hongmei
> > > Cc: meta-arago@arago-project.org; Senicic, Djordje
> > > Subject: Re: [meta-arago] [morty/krogoth][PATCH 1/4] voxelsdk: add 
> > > version
> > > 0.6.8
> > > 
> > > On Fri, Mar 17, 2017 at 03:37:51PM -0400, Hongmei Gou wrote:
> > > > Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> > > > Signed-off-by: Hongmei Gou <h-gou@ti.com>
> > > > ---
> > > >  .../voxelsdk/0001-PLSDK-AM437x-update.patch        |  73 +++++
> > > >  .../voxelsdk/voxelsdk/0002-Fix-SWIG-support.patch  |  37 +++ 
> > > > ...mmand-line-options-and-move-OpenCV-render.patch | 324
> > > +++++++++++++++++++++
> > > >  .../recipes-apps/voxelsdk/voxelsdk_git.bb          |  51 ++++
> > > >  4 files changed, 485 insertions(+)
> > > >  create mode 100644
> > > > meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0001-PLSDK-AM437x-
> > > upd
> > > > ate.patch  create mode 100644
> > > > meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0002-Fix-SWIG-
> > > support
> > > > .patch  create mode 100644
> > > > meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0003-Add-more-
> > > command
> > > > -line-options-and-move-OpenCV-render.patch
> > > >  create mode 100644
> > > > meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
> > > >
> > > > diff --git
> > > > a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0001-PLSDK-
> > > AM437x-u
> > > > pdate.patch
> > > > b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0001-PLSDK-
> > > AM437x-u
> > > > pdate.patch
> > > > new file mode 100644
> > > > index 0000000..2e1e740
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0001-PLSDK-
> > > AM43
> > > > +++ 7x-update.patch
> > > > @@ -0,0 +1,73 @@
> > > > +From 9ef95f0defcd7215b3d514e7fb7321cd299882cd Mon Sep 17 00:00:00
> > > > +2001
> > > > +From: Djordje Senicic <d-senicic1@ti.com>
> > > > +Date: Wed, 22 Feb 2017 12:21:07 -0500
> > > > +Subject: [PATCH] PLSDK AM437x update
> > > > +
> > > > +Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> > > > +---
> > > > + CMakeLists.txt                  | 11 ++++++++++-
> > > > + Voxel/CMakeLists.txt            |  2 +-
> > > > + Voxel/SWIG/standard_container.i |  5 +++--
> > > > + 3 files changed, 14 insertions(+), 4 deletions(-)
> > > > +
> > > > +diff --git a/CMakeLists.txt b/CMakeLists.txt index ed7a015..a187c96
> > > > +100644
> > > > +--- a/CMakeLists.txt
> > > > ++++ b/CMakeLists.txt
> > > > +@@ -26,9 +26,18 @@ if(CMAKE_SYSTEM_NAME STREQUAL "Linux")
> > > > +   SET(ARM_PLATFORM 1)
> > > > +
> > > > +   if(ARM_PLATFORM)
> > > > +-    add_definitions(-mtune=arm7 -mfpu=neon-vfpv4 -mfloat-abi=hard -
> > > pthread -std=c++11 -fPIC -ffast-math)
> > > > ++#    add_definitions(-mtune=arm7 -mfpu=neon-vfpv4 -mfloat-abi=hard -
> > > pthread -std=c++11 -fPIC -ffast-math)
> > > > +     #-DARM_OPT to enable arm optimizaions
> > > > +     ADD_DEFINITIONS(-DARM_OPT)
> > > > ++#OK:
> > > > ++#add_definitions(-mtune=arm7 -mfloat-abi=hard -pthread -std=c++11 
> > > > ++-fPIC -ffast-math)
> > > > ++#OK:
> > > > ++#add_definitions(-ffast-math -mcpu=cortex-a9 -mfloat-abi=hard
> > > > ++-mfpu=neon-fp16 -fPIC -pthread -std=c++11)
> > > > ++#OK:
> > > > ++#add_definitions(-ffast-math -mcpu=cortex-a9 -mfloat-abi=hard 
> > > > ++-mfpu=neon -fPIC -pthread -std=c++11)
> > > > ++
> > > > ++add_definitions(-mtune=arm7 -mfpu=neon -mfloat-abi=hard -pthread
> > > > ++-std=c++11 -fPIC -ffast-math)
> > > > ++
> > > > +     ADD_DEFINITIONS(-DCOMMON_OPT)
> > > > +
> > > > +   else()
> > > > +diff --git a/Voxel/CMakeLists.txt b/Voxel/CMakeLists.txt index
> > > > +ae98e81..74528d8 100644
> > > > +--- a/Voxel/CMakeLists.txt
> > > > ++++ b/Voxel/CMakeLists.txt
> > > > +@@ -149,7 +149,7 @@ install(FILES
> > > > +   COMPONENT voxel_dev
> > > > + )
> > > > +
> > > > +-#add_subdirectory(SWIG)
> > > > ++add_subdirectory(SWIG)
> > > > +
> > > > + IF(LINUX)
> > > > +   set(CPACK_COMPONENTS_ALL voxel)
> > > > +diff --git a/Voxel/SWIG/standard_container.i 
> > > > +b/Voxel/SWIG/standard_container.i index f61e342..1d2cb66 100644
> > > > +--- a/Voxel/SWIG/standard_container.i
> > > > ++++ b/Voxel/SWIG/standard_container.i
> > > > +@@ -113,7 +113,7 @@
> > > > +
> > > > + %enddef
> > > > +
> > > > +-
> > > > ++#if SWIG_VERSION < 0x030008
> > > > + //
> > > > + // Ignore member methods for Type with no default constructor  // 
> > > > +@@
> > > > +-124,4 +124,5 @@
> > > > + %feature("ignore") std::deque<Type >::resize(size_type size);
> > > > + %feature("ignore") std::list<Type >::list(size_type size);
> > > > + %feature("ignore") std::list<Type >::resize(size_type size); 
> > > > +-%enddef \ No newline at end of file
> > > > ++%enddef
> > > > ++#endif
> > > > +--
> > > > +1.9.1
> > > > +
> > > > diff --git
> > > > a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0002-Fix-SWIG-
> > > suppo
> > > > rt.patch
> > > > b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0002-Fix-SWIG-
> > > suppo
> > > > rt.patch
> > > > new file mode 100644
> > > > index 0000000..77a6de1
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0002-Fix-SWIG
> > > > +++ -
> > > s
> > > > +++ upport.patch
> > > > @@ -0,0 +1,37 @@
> > > > +From a800f446d9c976f6fb11f4d601cc386bbdce59e1 Mon Sep 17 00:00:00
> > > > +2001
> > > > +From: Djordje Senicic <d-senicic1@ti.com>
> > > > +Date: Wed, 22 Feb 2017 14:14:52 -0500
> > > > +Subject: [PATCH] Fix SWIG support
> > > > +
> > > > +Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> > > > +---
> > > > + Voxel/SWIG/CMakeLists.txt | 5 +++--
> > > > + 1 file changed, 3 insertions(+), 2 deletions(-)
> > > > +
> > > > +diff --git a/Voxel/SWIG/CMakeLists.txt b/Voxel/SWIG/CMakeLists.txt 
> > > > +index a4f6d53..f4070ac 100644
> > > > +--- a/Voxel/SWIG/CMakeLists.txt
> > > > ++++ b/Voxel/SWIG/CMakeLists.txt
> > > > +@@ -1,10 +1,11 @@
> > > > +-SET(GENERATE_PYTHON_BINDINGS "FALSE" CACHE BOOL "Controls
> > > generation
> > > > +of Python bindings")
> > > > ++SET(GENERATE_PYTHON_BINDINGS "TRUE" CACHE BOOL "Controls
> > > generation
> > > > ++of Python bindings")
> > > > +
> > > > + IF(${GENERATE_PYTHON_BINDINGS})
> > > > +
> > > > + FIND_PACKAGE(SWIG REQUIRED)
> > > > + INCLUDE(${SWIG_USE_FILE})
> > > > +
> > > > ++SET(Python_ADDITIONAL_VERSIONS 2.7)
> > > > + FIND_PACKAGE(PythonLibs)
> > > > + INCLUDE_DIRECTORIES(${PYTHON_INCLUDE_PATH})
> > > > +
> > > > +@@ -46,4 +47,4 @@ install(FILES
> > > > +   DESTINATION lib/python2.7
> > > > +   COMPONENT voxel_python
> > > > + )
> > > > +-ENDIF()
> > > > +\ No newline at end of file
> > > > ++ENDIF()
> > > > +--
> > > > +1.9.1
> > > > +
> > > > diff --git
> > > > a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0003-Add-more-
> > > comma
> > > > nd-line-options-and-move-OpenCV-render.patch
> > > > b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0003-Add-more-
> > > comma
> > > > nd-line-options-and-move-OpenCV-render.patch
> > > > new file mode 100644
> > > > index 0000000..4ab74e6
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk/0003-Add-
> > > more-c
> > > > +++ ommand-line-options-and-move-OpenCV-render.patch
> > > > @@ -0,0 +1,324 @@
> > > > +From 29cc2430579eb257d9e1ac1caf0b4515278fd375 Mon Sep 17 00:00:00
> > > > +2001
> > > > +From: Djordje Senicic <d-senicic1@ti.com>
> > > > +Date: Mon, 13 Mar 2017 19:51:30 -0400
> > > > +Subject: [PATCH] Add more command line options and move OpenCV 
> > > > +rendering to  main thread
> > > > +
> > > > +Signed-off-by: Djordje Senicic <d-senicic1@ti.com>
> > > > +---
> > > > + Demos/Horus.cpp                | 98 +++++++++++++++++++++++++------------
> > > -----
> > > > + Demos/SimplePeopleTracking.cpp | 91
> > > ++++++++++++++++++++++++++++++++-------
> > > > + Demos/TOFApp.cpp               | 14 +++---
> > > > + 3 files changed, 139 insertions(+), 64 deletions(-)
> > > > +
> > > > +diff --git a/Demos/Horus.cpp b/Demos/Horus.cpp index
> > > e0181af..de1837e
> > > > +100644
> > > > +--- a/Demos/Horus.cpp
> > > > ++++ b/Demos/Horus.cpp
> > > > +@@ -24,6 +24,12 @@
> > > > + #include <stdlib.h>
> > > > +
> > > > + extern int skipped_frames;
> > > > ++extern pthread_mutex_t main_thread_image_mtx; extern Mat 
> > > > ++app_image[]; extern int main_thread_image_rd; extern int 
> > > > ++main_thread_image_wr; extern int main_thread_image_cnt; extern
> > > char
> > > > ++show_image;
> > > > +
> > > > + Horus::Horus(int w, int h) : TOFApp(w, h)  { @@ -126,10 +132,9 @@ 
> > > > +bool Horus::isPerson(vector<cv::Point> &contour, Mat dMat)
> > > > +    return rc;
> > > > + }
> > > > +
> > > > +-static int draw_throttle = 0;
> > > > +-
> > > > + void Horus::update(Frame *frame)
> > > > + {
> > > > ++   Mat drawing;
> > > > +    vector< vector<cv::Point> > contours;
> > > > +    vector<Vec4i> hierarchy;
> > > > +    RNG rng(12345);
> > > > +@@ -147,51 +152,66 @@ void Horus::update(Frame *frame)
> > > > +
> > > > +       // Apply amplitude gain
> > > > +       _iMat = (float)_ampGain*_iMat;
> > > > ++      if(show_image == 'p')
> > > > ++      { //Skip below processing if we are not detecting people!
> > > > ++        // Update background as required
> > > > ++        if (!_setBackground) {
> > > > ++           _dMat.copyTo(_bkgndMat);
> > > > ++           _setBackground = true;
> > > > ++           cout << endl << "Updated background" << endl;
> > > > ++        }
> > > > +
> > > > +-      // Update background as required
> > > > +-      if (!_setBackground) {
> > > > +-         _dMat.copyTo(_bkgndMat);
> > > > +-         _setBackground = true;
> > > > +-         cout << endl << "Updated background" << endl;
> > > > +-      }
> > > > +-
> > > > +-      // Find foreground by subtraction
> > > > +-      Mat fMat = _bkgndMat-_dMat;
> > > > ++        // Find foreground by subtraction
> > > > ++        Mat fMat = _bkgndMat-_dMat;
> > > > +
> > > > +-      // Convert to binary image based on amplitude and depth thresholds
> > > > +-      clipBackground(fMat, _iMat, (float)_depthThresh/100.0,
> > > (float)_ampThresh/100.0);
> > > > +-      fMat.convertTo(_bMat, CV_8U, 255.0);
> > > > ++        // Convert to binary image based on amplitude and depth thresholds
> > > > ++        clipBackground(fMat, _iMat, (float)_depthThresh/100.0,
> > > (float)_ampThresh/100.0);
> > > > ++        fMat.convertTo(_bMat, CV_8U, 255.0);
> > > > +
> > > > +-      // Apply morphological open to clean up image
> > > > +-      Mat morphMat = _bMat.clone();
> > > > +-      Mat element = getStructuringElement( 0, Size(3,3), cv::Point(1,1) );
> > > > +-      morphologyEx(_bMat, morphMat, 2, element);
> > > > ++        // Apply morphological open to clean up image
> > > > ++        Mat morphMat = _bMat.clone();
> > > > ++        Mat element = getStructuringElement( 0, Size(3,3), cv::Point(1,1) );
> > > > ++        morphologyEx(_bMat, morphMat, 2, element);
> > > > +
> > > > +-      // Find all contours
> > > > +-      findContours(morphMat, contours, hierarchy, CV_RETR_TREE,
> > > > +-                             CV_CHAIN_APPROX_SIMPLE, cv::Point(0,0));
> > > > ++        // Find all contours
> > > > ++        findContours(morphMat, contours, hierarchy, CV_RETR_TREE,
> > > > ++                               CV_CHAIN_APPROX_SIMPLE, 
> > > > ++ cv::Point(0,0));
> > > > +
> > > > +-      // Draw contours that meet a "person" requirement
> > > > +-      Mat drawing = Mat::zeros(_iMat.size(), CV_8UC3);
> > > > +-      cvtColor(_iMat, drawing, CV_GRAY2RGB);
> > > > ++        // Draw contours that meet a "person" requirement
> > > > ++        drawing = Mat::zeros(_iMat.size(), CV_8UC3);
> > > > ++        cvtColor(_iMat, drawing, CV_GRAY2RGB);
> > > > +
> > > > +-      int peopleCount = 0;
> > > > +-      for ( int i = 0; i < contours.size(); i++ ) {
> > > > +-         if (isPerson(contours[i], _dMat)) {
> > > > +-            peopleCount++;
> > > > +-            drawContours( drawing, contours, i, Scalar(0, 0, 255), 2, 8,
> > > vector<Vec4i>(), 0, cv::Point() );
> > > > +-         }
> > > > ++        int peopleCount = 0;
> > > > ++        for ( int i = 0; i < contours.size(); i++ ) {
> > > > ++           if (isPerson(contours[i], _dMat)) {
> > > > ++              peopleCount++;
> > > > ++              drawContours( drawing, contours, i, Scalar(0, 0, 
> > > > ++ 255), 2, 8,
> > > vector<Vec4i>(), 0, cv::Point() );
> > > > ++           }
> > > > ++        }
> > > > ++        putText(drawing, "Cnt="+to_string(peopleCount), 
> > > > ++ cv::Point(40, 30), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
> > > > +       }
> > > > +-      putText(drawing, "Cnt="+to_string(peopleCount), cv::Point(40, 30),
> > > FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
> > > > +-      if(skipped_frames == 0) {
> > > > +-        imshow("Draw", drawing);
> > > > +-      } else {
> > > > +-        if((draw_throttle % skipped_frames) == 0) {
> > > > +-          char file_name[80];
> > > > +-          sprintf (file_name, "draw%03d.png", draw_throttle /
> > > skipped_frames);
> > > > +-          imwrite (file_name, drawing);
> > > > ++
> > > > ++      if(main_thread_image_cnt < 2)
> > > > ++      {
> > > > ++        switch (show_image)
> > > > ++        {
> > > > ++          case 'i':
> > > > ++            _iMat.copyTo(app_image[main_thread_image_wr]);
> > > > ++            putText(app_image[main_thread_image_wr], "Ampl Map",
> > > cv::Point(30, 20), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
> > > > ++            break;
> > > > ++          case 'd':
> > > > ++            _dMat.copyTo(app_image[main_thread_image_wr]);
> > > > ++            putText(app_image[main_thread_image_wr], "Dist Map",
> > > cv::Point(30, 20), FONT_HERSHEY_PLAIN, 1, Scalar(255, 0, 0));
> > > > ++            break;
> > > > ++          default:
> > > > ++            drawing.copyTo(app_image[main_thread_image_wr]);
> > > > ++            break;
> > > > +         }
> > > > +-        draw_throttle ++;
> > > > ++        pthread_mutex_lock(&main_thread_image_mtx);
> > > > ++          main_thread_image_wr ++;
> > > > ++          main_thread_image_wr %= 2;
> > > > ++          main_thread_image_cnt ++;
> > > > ++        pthread_mutex_unlock(&main_thread_image_mtx);
> > > > +       }
> > > > +    }
> > > > + }
> > > > +diff --git a/Demos/SimplePeopleTracking.cpp 
> > > > +b/Demos/SimplePeopleTracking.cpp index 8c6e9d4..1eb8e16 100644
> > > > +--- a/Demos/SimplePeopleTracking.cpp
> > > > ++++ b/Demos/SimplePeopleTracking.cpp
> > > > +@@ -1,6 +1,18 @@
> > > > + #include "Horus.h"
> > > > ++#include <getopt.h>
> > > > +
> > > > + int skipped_frames = 0;
> > > > ++int resolution_width = 160, resolution_height = 120; //Variables 
> > > > ++for communication between main and application thread 
> > > > ++pthread_mutex_t main_thread_image_mtx; int main_thread_image_rd = 
> > > > ++0; int main_thread_image_wr = 0; int main_thread_image_cnt = 0; 
> > > > ++int acq_fps = 30; char show_image = 'p'; //By default, detect 
> > > > ++people int fps = 30;
> > > > ++
> > > > ++Mat app_image[2];
> > > > +
> > > > + int getkey() {
> > > > +     int character;
> > > > +@@ -27,29 +39,58 @@ int getkey() {
> > > > +
> > > > + #define TOF_FRAME_TYPE
> > > 	DepthCamera::FRAME_XYZI_POINT_CLOUD_FRAME
> > > > +
> > > > ++void print_usage(void)
> > > > ++{
> > > > ++  printf ("\nFollwoing command line options available:");
> > > > ++  printf ("\n  -s <decimal value>");
> > > > ++  printf ("\n   If you want to run demo without keyboard, provide
> > > 'skipped_frames' as argument (e.g. SimplePeopleTracking -s 30)!");
> > > > ++  printf ("\n   Images with the result of processing are saved in PNG files.
> > > This test always stops after 10 image files recorded\n");
> > > > ++  printf ("\n -w <resolution witdh,  default is 160, another 
> > > > ++resolution possible is 320x240>");
> > > > ++  printf ("\n -h <resolution height, default is 120, another 
> > > > ++respolution possible is 320x240>");
> > > > ++  printf ("\n -i <present image of amplitudes, grey-scale like 
> > > > ++image
> > > > ++- default is detection of people>");
> > > > ++  printf ("\n -d <present distance map - default is detection of
> > > > ++people>");
> > > > ++  printf ("\n -f <set fps with integer value, 30 is default, 10, 
> > > > ++15,
> > > > ++25 are another options to try>");
> > > > ++  printf ("\n-----------\n");
> > > > ++}
> > > > ++
> > > > + int main(int argc, char *argv[])
> > > > + {
> > > > +-int ii = 0;
> > > > +-   int key;
> > > > ++   int ii = 0, draw_throttle = 0;
> > > > ++   int key, c_opt;
> > > > +    bool done = false;
> > > > +-   Mat bImg;
> > > > +-
> > > > +-   if(argc > 1) skipped_frames = atoi(argv[1]);
> > > > +-   else {
> > > > +-     printf ("\nIf you want to run demo without keyboard, provide
> > > 'skipped_frames' as argument (e.g. SimplePeopleTracking 30)!");
> > > > +-     printf ("\nImages with the result of processing are saved in PNG files.
> > > This test always stops after 15 seconds\n");
> > > > ++   Mat bImg, locImg;
> > > > ++
> > > > ++   while ((c_opt = getopt(argc, argv,"s:w:h:f:id")) != -1) {
> > > > ++        switch (c_opt) {
> > > > ++             case 's' : skipped_frames = atoi(optarg);
> > > > ++                 break;
> > > > ++             case 'w' : resolution_width = atoi(optarg);
> > > > ++                 break;
> > > > ++             case 'h' : resolution_height = atoi(optarg);
> > > > ++                 break;
> > > > ++             case 'f' : acq_fps = atoi(optarg);
> > > > ++                 break;
> > > > ++             case 'i' : show_image = 'i';
> > > > ++                 break;
> > > > ++             case 'd' : show_image = 'd';
> > > > ++                 break;
> > > > ++             default: print_usage();
> > > > ++                 exit(EXIT_FAILURE);
> > > > ++        }
> > > > +    }
> > > > ++   printf ("\nUsing following parameters: skipped_frames=%d 
> > > > ++ width=%d
> > > height=%d mode=%c fps=%d. Use '-?' to get help.\n",
> > > > ++           skipped_frames, resolution_width, resolution_height, 
> > > > ++ show_image, acq_fps);
> > > > +
> > > > +-   //Horus eye(320, 240);
> > > > +-   Horus eye(160, 120);
> > > > +-   //Horus eye(80, 60);
> > > > ++   Horus eye(resolution_width, resolution_height);
> > > > +
> > > > +    if (!eye.connect(TOF_FRAME_TYPE)) {
> > > > +       cout << "Cannot connect" << endl;
> > > > +       return -1;
> > > > +    }
> > > > +    eye.start();
> > > > +-   while (!done) {
> > > > ++
> > > > ++   while (!done)
> > > > ++   {
> > > > +      if(skipped_frames == 0)
> > > > +      {
> > > > +        char key = getkey();
> > > > +@@ -57,11 +98,29 @@ int ii = 0;
> > > > +           done = true;
> > > > +        else if (key == 'b')
> > > > +           eye.resetBackground();
> > > > +-     } else {
> > > > +-       usleep(100000);
> > > > +-       ii ++;
> > > > +-       if(ii == 150) done = true;
> > > > +      }
> > > > ++     //Exchange data with the applicaiton thread
> > > > ++     if(main_thread_image_cnt > 0)
> > > > ++     { //imshow() does not work reliable if being ran from non-main thread
> > > > ++       locImg = app_image[main_thread_image_rd];
> > > > ++       if(skipped_frames)
> > > > ++       {
> > > > ++         if((draw_throttle % skipped_frames) == 0) {
> > > > ++           char file_name[80];
> > > > ++           sprintf (file_name, "draw%03d.png", draw_throttle /
> > > skipped_frames);
> > > > ++           imwrite (file_name, locImg);
> > > > ++           std::cout << "Write file:" << file_name << std::endl << std::flush;
> > > > ++         }
> > > > ++         draw_throttle ++;
> > > > ++         if(draw_throttle >= (10 * skipped_frames)) done = true; 
> > > > ++ //Collect 10
> > > image files only in batch mode
> > > > ++       } else imshow ("Draw", locImg);
> > > > ++       pthread_mutex_lock(&main_thread_image_mtx);
> > > > ++         main_thread_image_rd ++;
> > > > ++         main_thread_image_rd %= 2;
> > > > ++         main_thread_image_cnt --;
> > > > ++       pthread_mutex_unlock(&main_thread_image_mtx);
> > > > ++     }
> > > > ++     waitKey(20);
> > > > +    }
> > > > +
> > > > + err_exit:
> > > > +diff --git a/Demos/TOFApp.cpp b/Demos/TOFApp.cpp index
> > > > +1c9c0cd..cb41286 100644
> > > > +--- a/Demos/TOFApp.cpp
> > > > ++++ b/Demos/TOFApp.cpp
> > > > +@@ -22,7 +22,7 @@
> > > > + #define FRAME_QUEUE_SZ		3
> > > > +
> > > > + extern int skipped_frames;
> > > > +-
> > > > ++extern int acq_fps;
> > > > + // Frame callback
> > > > + static deque<Voxel::Frame *> qFrame;  static pthread_mutex_t gmtx; 
> > > > +@@ -166,11 +166,7 @@ void *TOFApp::eventLoop(void *p)
> > > > +       }
> > > > +
> > > > +       done = !app->_isRunning;
> > > > +-      if(skipped_frames == 0) {
> > > > +-        waitKey(app->_loopDelay);
> > > > +-      } else {
> > > > +-        usleep(10000);
> > > > +-      }
> > > > ++      usleep(10000);
> > > > +    }
> > > > +
> > > > +    app->disconnect();
> > > > +@@ -196,9 +192,9 @@ void TOFApp::Init(int w, int h)
> > > > +    _isConnected = false;
> > > > +    _dimen.width = w;
> > > > +    _dimen.height = h;
> > > > +-   _frate.numerator = 30;
> > > > ++   _frate.numerator = acq_fps; //30
> > > > +    _frate.denominator = 1;
> > > > +-   _loopDelay = 66;
> > > > ++   _loopDelay = (int)(1000 / acq_fps);
> > > > +    _illum_power = 60;
> > > > +    _intg = 20;
> > > > +    _profile = "MetrilusLongRange"; @@ -219,7 +215,7 @@ bool 
> > > > +TOFApp::connect(DepthCamera::FrameType
> > > frmType)
> > > > +    else
> > > > +       return false;
> > > > +
> > > > +-   #if 0   //Enable this to list all the profiles that are supported by the
> > > camera
> > > > ++   #if 1   //Enable this to list all the profiles that are supported by the
> > > camera
> > > > +    cout << "List of Profiles:" << endl;
> > > > +    auto &names = _depthCamera->configFile.getCameraProfileNames();
> > > > +
> > > > +--
> > > > +1.9.1
> > > > +
> > > > diff --git a/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
> > > > b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
> > > > new file mode 100644
> > > > index 0000000..0189ce0
> > > > --- /dev/null
> > > > +++ b/meta-arago-extras/recipes-apps/voxelsdk/voxelsdk_git.bb
> > > > @@ -0,0 +1,51 @@
> > > > +DESCRIPTION = "VOXELSDK and 3D scanning application"
> > > 
> > > For short descriptions, please use SUMMARY instead
> > > 
> > > 
> > > > +HOMEPAGE = "https://github.com/3dtof/voxelsdk"
> > > > +SECTION = "multimedia"
> > > > +LICENSE = "BSD-3-Clause"
> > > > +LIC_FILES_CHKSUM =
> > > "file://LICENSE;md5=e69c599445026ffeae140a21181dfa88"
> > > > +
> > > > +PV = "0.6.8"
> > > > +PR = "r1"
> > > > +BRANCH="plsdk-devel"
> > > 
> > > Not critical, but since there will be v2, please use consistent 
> > > formatting with spaces around = sign.
> > > 
> > > 
> > > > +SRC_URI = "git://github.com/3dtof/voxelsdk.git;branch=${BRANCH}"
> > > > +SRCREV  = "7337ac265a1542f22ccffe592762c226b23b2dbd"
> > > > +
> > > > +SRC_URI += " \
> > > > +            file://0001-PLSDK-AM437x-update.patch;patchdir=${S} \
> > > > +            file://0002-Fix-SWIG-support.patch;patchdir=${S} \
> > > > +            
> > > > +file://0003-Add-more-command-line-options-and-move-OpenCV-
> > > render.patch;patchdir=${S} \
> > > > +           "
> > > > +
> > > > +S = "${WORKDIR}/git"
> > > > +
> > > > +export CMAKE_PREFIX_PATH="${WORKDIR}/build"
> > > > +
> > > > +CXXFLAGS_append = "-I${STAGING_INCDIR}/libusb-1.0 "
> > > 
> > > Using _append, but missing leading space and having unnecessary 
> > > trailing space.
> > > 
> > > 
> > > > +EXTRA_OECMAKE += "-DDISTROFEATURE=ExcludePCL -
> > > DCMAKE_BUILD_TYPE=Debug -
> > > DPYTHON_INCLUDE_DIRS=${STAGING_INCDIR}/include/python2.7 "
> > > 
> > > Trailing space.
> > > BTW, any plan to use python3 instead of 2.7?
> > > 
> > > 
> > > > +inherit pkgconfig cmake pythonnative python-dir
> > > > +
> > > > +DEPENDS = "libusb1 udev opencv boost python python-dev swig swig-
> > > native "
> > > 
> > > Trailing space.
> > > 
> > > 
> > > > +RDEPENDS_${PN} = "libusb1 udev opencv"
> > > > +
> > > > +do_install_append () {
> > > > +    install -d ${D}${bindir}
> > > > +    install -m 0775 ${S}/Test/CameraSystemTest.py ${D}${bindir}
> > > > +    install -m 0775 ${S}/Test/CameraSystemIQFrameTest.py ${D}${bindir}
> > > > +    install -m 0775 ${S}/Test/LensCalibrationTest.py ${D}${bindir} 
> > > > +}
> > > > +
> > > > +FILES_${PN} = "${bindir}"
> > > 
> > > This is the default. No need to re-do the default.
> > > 
> > > 
> > > > +FILES_${PN} += "${datadir}"
> > > > +FILES_${PN} += "/etc /etc/udev /etc/udev/rules.d /etc/udev/rules.d/*"
> > > > +FILES_${PN} += "${libdir}/*.so.*"
> > > 
> > > This is also the default.
> > > 
> > > 
> > > > +FILES_${PN} += "${libdir}/voxel/*.so.*"
> > > > +FILES_${PN} += "${libdir}/python2.7/_*.so"
> > > > +FILES_${PN} += "${libdir}/python2.7/*.py"
> > > > +
> > > > +FILES_${PN}-dev += "${libdir}/cmake ${libdir}/cmake/Voxel
> > > ${libdir}/cmake/TI3DToF"
> > > > +FILES_${PN}-dev += "${libdir}/cmake/Voxel/*.cmake"
> > > > +FILES_${PN}-dev += "${libdir}/cmake/TI3DToF/*.cmake"
> > > > +FILES_${PN}-dev += "${libdir}/*.so"
> > > 
> > > As well as this one.
> > > 
> > > 
> > > > +FILES_${PN}-dev += "${libdir}/voxel/*.so"
> > > 
> > > --
> > > Denys

