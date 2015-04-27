Return-Path: <j-stiffler@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 3D45E52099
	for <meta-arago@arago-project.org>;
	Mon, 27 Apr 2015 11:51:47 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t3RBpjwX012489
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 06:51:45 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RBpioc022188
	for <meta-arago@arago-project.org>; Mon, 27 Apr 2015 06:51:44 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 27 Apr 2015 06:51:44 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t3RBpiA5025651;
	Mon, 27 Apr 2015 06:51:44 -0500
Message-ID: <553E22CF.1080900@ti.com>
Date: Mon, 27 Apr 2015 07:51:43 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
References: <B0581B5571079145BA1CD78C126DBDE73222E69C@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE73222E69C@DLEE08.ent.ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: gstreamer1.0-plugins-bad: Update DEPENDS
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
X-List-Received-Date: Mon, 27 Apr 2015 11:51:48 -0000
Content-Type: multipart/alternative;
	boundary="------------040306040702080309040403"

--------------040306040702080309040403
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Karthik, Denys,

I have been looking into the build failures for am335x-evm so that we 
may test integrating gstreamer 1.2.

I see that the patch 0001-Added-GstDRMBufferPool-support.patch adds the 
drm support irregardless of whether libdrm was detected. Shouldn't this 
take the approach or EGL in the same file? If HAVE_KMS, then DRM_DIR=drm...

Here's the relevent portion of the patch:

diff --git a/gst-libs/gst/Makefile.am b/gst-libs/gst/Makefile.am
index 1d6cc35..b915d07 100644
--- a/gst-libs/gst/Makefile.am
+++ b/gst-libs/gst/Makefile.am
@@ -2,7 +2,7 @@ if HAVE_EGL
  EGL_DIR = egl
  endif

-SUBDIRS = interfaces basecamerabinsrc codecparsers \
+SUBDIRS = interfaces basecamerabinsrc codecparsers drm \
          insertbin uridownloader mpegts $(EGL_DIR)

  noinst_HEADERS = gst-i18n-plugin.h gettext.h glib-compat-private.h

Let me know if testing the "HAVE_KMS" is the correct approach. I see 
that for including the gstreamer kms plugin, "USE_KMS" is used to 
determine whether to build. From 0003-Added-KMSsink-support.patch:

diff --git a/sys/Makefile.am b/sys/Makefile.am
index b1abda6..b87a1ca 100644
--- a/sys/Makefile.am
+++ b/sys/Makefile.am
@@ -106,6 +106,12 @@ else
  PVR_DIR=
  endif

+if USE_KMS
+KMS_DIR=kms
+else
+KMS_DIR=
+endif
+
  if USE_SHM
  SHM_DIR=shm
  else
@@ -166,9 +172,9 @@ else
  MFC_DIR=
  endif

-SUBDIRS = $(ACM_DIR) $(ANDROID_MEDIA_DIR) $(APPLE_MEDIA_DIR) $(AVC_DIR) 
$(BLUEZ_DIR) $(D3DVIDEOSINK_DIR) $(DECKLINK_DIR) $(DIRECTDRAW_DIR) 
$(DIRECTSOUND_DIR) $(DIRECTSHOW_DIR) $(DVB_DIR) $(FBDEV_DIR) 
$(LINSYS_DIR) $(OPENSLES_DIR) $(OSX_VIDEO_DIR) $(PVR_DIR) $(QT_DIR) 
$(SHM_DIR) $(UVCH264_DIR) $(VCD_DIR) $(VDPAU_DIR) $(WININET_DIR) 
$(WINSCREENCAP_DIR) $(WASAPI_DIR) $(MFC_DIR)
+SUBDIRS = $(ACM_DIR) $(ANDROID_MEDIA_DIR) $(APPLE_MEDIA_DIR) $(AVC_DIR) 
$(BLUEZ_DIR) $(D3DVIDEOSINK_DIR) $(DECKLINK_DIR) $(DIRECTDRAW_DIR) 
$(DIRECTSOUND_DIR) $(DIRECTSHOW_DIR) $(DVB_DIR) $(FBDEV_DIR) 
$(LINSYS_DIR) $(OPENSLES_DIR) $(OSX_VIDEO_DIR) $(PVR_DIR) $(QT_DIR) 
$(KMS_DIR) $(SHM_DIR) $(UVCH264_DIR) $(VCD_DIR) $(VDPAU_DIR) 
$(WININET_DIR) $(WINSCREENCAP_DIR) $(WASAPI_DIR) $(MFC_DIR)

  DIST_SUBDIRS = acmenc acmmp3dec androidmedia applemedia 
applemedia-nonpublic avc bluez d3dvideosink decklink directdraw 
directsound dvb linsys fbdev dshowdecwrapper dshowsrcwrapper 
dshowvideosink \
-               opensles osxvideo pvr2d qtwrapper shm uvch264 vcd vdpau 
wasapi wininet winks winscreencap mfc
+               opensles osxvideo pvr2d qtwrapper kms shm uvch264 vcd 
vdpau wasapi wininet winks winscreencap mfc

  include $(top_srcdir)/common/parallel-subdirs.mak


Thank you,
Jake

On 3/26/2015 11:21 AM, Dmytriyenko, Denys wrote:
>
> Unfortunately, that will make the resulting packages machine specific, 
> which I want to avoid due to build issues we've had with gst 0.10...
>
> -- 
> Denys
>
> On Mar 26, 2015 05:59, "R, Karthik" <karthik.ramanan@ti.com> wrote:
>
>     * Make the feature additions specific to dra7xx due
>        to the dependencies
>
>     Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>     ---
>      .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    6 ++++--
>      1 file changed, 4 insertions(+), 2 deletions(-)
>
>     diff --git
>     a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>     b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>     index b1cacac..72e67f5 100644
>     ---
>     a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>     +++
>     b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
>     @@ -2,11 +2,13 @@ FILESEXTRAPATHS_prepend := "${THISDIR}/${PN}:"
>
>      PACKAGECONFIG = "faad wayland"
>
>     -SRC_URI_append = " \
>     +DEPENDS_${PN}_append_dra7xx = " libdce libdrm"
>     +
>     +SRC_URI_append_dra7xx = " \
>              file://0001-Added-GstDRMBufferPool-support.patch \
>     file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
>              file://0003-Added-KMSsink-support.patch \
>     file://0004-waylandsink-Removed-dependency-on-dri2.patch \
>     file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
>
>     -PR_append = "-arago0"
>     +PR_append = "-arago1"
>     -- 
>     1.7.9.5
>
>     _______________________________________________
>     meta-arago mailing list
>     meta-arago@arago-project.org
>     http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>
>
>
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


--------------040306040702080309040403
Content-Type: text/html; charset="windows-1252"
Content-Transfer-Encoding: 8bit

<html>
  <head>
    <meta content="text/html; charset=windows-1252"
      http-equiv="Content-Type">
  </head>
  <body bgcolor="#FFFFFF" text="#000000">
    Karthik, Denys,<br>
    <br>
    I have been looking into the build failures for am335x-evm so that
    we may test integrating gstreamer 1.2.<br>
    <br>
    I see that the patch 0001-Added-GstDRMBufferPool-support.patch adds
    the drm support irregardless of whether libdrm was detected.
    Shouldn't this take the approach or EGL in the same file? If
    HAVE_KMS, then DRM_DIR=drm...<br>
    <br>
    Here's the relevent portion of the patch:<br>
    <br>
    diff --git a/gst-libs/gst/Makefile.am b/gst-libs/gst/Makefile.am<br>
    index 1d6cc35..b915d07 100644<br>
    --- a/gst-libs/gst/Makefile.am<br>
    +++ b/gst-libs/gst/Makefile.am<br>
    @@ -2,7 +2,7 @@ if HAVE_EGL<br>
     EGL_DIR = egl<br>
     endif<br>
    <br>
    -SUBDIRS = interfaces basecamerabinsrc codecparsers \<br>
    +SUBDIRS = interfaces basecamerabinsrc codecparsers drm \<br>
             insertbin uridownloader mpegts $(EGL_DIR)<br>
    <br>
     noinst_HEADERS = gst-i18n-plugin.h gettext.h glib-compat-private.h<br>
    <br>
    Let me know if testing the "HAVE_KMS" is the correct approach. I see
    that for including the gstreamer kms plugin, "USE_KMS" is used to
    determine whether to build. From 0003-Added-KMSsink-support.patch:<br>
    <br>
    diff --git a/sys/Makefile.am b/sys/Makefile.am<br>
    index b1abda6..b87a1ca 100644<br>
    --- a/sys/Makefile.am<br>
    +++ b/sys/Makefile.am<br>
    @@ -106,6 +106,12 @@ else<br>
     PVR_DIR=<br>
     endif<br>
    <br>
    +if USE_KMS<br>
    +KMS_DIR=kms<br>
    +else<br>
    +KMS_DIR=<br>
    +endif<br>
    +<br>
     if USE_SHM<br>
     SHM_DIR=shm<br>
     else<br>
    @@ -166,9 +172,9 @@ else<br>
     MFC_DIR=<br>
     endif<br>
    <br>
    -SUBDIRS = $(ACM_DIR) $(ANDROID_MEDIA_DIR) $(APPLE_MEDIA_DIR)
    $(AVC_DIR) $(BLUEZ_DIR) $(D3DVIDEOSINK_DIR) $(DECKLINK_DIR)
    $(DIRECTDRAW_DIR) $(DIRECTSOUND_DIR) $(DIRECTSHOW_DIR) $(DVB_DIR)
    $(FBDEV_DIR) $(LINSYS_DIR) $(OPENSLES_DIR) $(OSX_VIDEO_DIR)
    $(PVR_DIR) $(QT_DIR) $(SHM_DIR) $(UVCH264_DIR) $(VCD_DIR)
    $(VDPAU_DIR) $(WININET_DIR) $(WINSCREENCAP_DIR) $(WASAPI_DIR)
    $(MFC_DIR)<br>
    +SUBDIRS = $(ACM_DIR) $(ANDROID_MEDIA_DIR) $(APPLE_MEDIA_DIR)
    $(AVC_DIR) $(BLUEZ_DIR) $(D3DVIDEOSINK_DIR) $(DECKLINK_DIR)
    $(DIRECTDRAW_DIR) $(DIRECTSOUND_DIR) $(DIRECTSHOW_DIR) $(DVB_DIR)
    $(FBDEV_DIR) $(LINSYS_DIR) $(OPENSLES_DIR) $(OSX_VIDEO_DIR)
    $(PVR_DIR) $(QT_DIR) $(KMS_DIR) $(SHM_DIR) $(UVCH264_DIR) $(VCD_DIR)
    $(VDPAU_DIR) $(WININET_DIR) $(WINSCREENCAP_DIR) $(WASAPI_DIR)
    $(MFC_DIR)<br>
    <br>
     DIST_SUBDIRS = acmenc acmmp3dec androidmedia applemedia
    applemedia-nonpublic avc bluez d3dvideosink decklink directdraw
    directsound dvb linsys fbdev dshowdecwrapper dshowsrcwrapper
    dshowvideosink \<br>
    -               opensles osxvideo pvr2d qtwrapper shm uvch264 vcd
    vdpau wasapi wininet winks winscreencap mfc<br>
    +               opensles osxvideo pvr2d qtwrapper kms shm uvch264
    vcd vdpau wasapi wininet winks winscreencap mfc<br>
    <br>
     include $(top_srcdir)/common/parallel-subdirs.mak<br>
    <br>
    <br>
    Thank you, <br>
    Jake<br>
    <br>
    <div class="moz-cite-prefix">On 3/26/2015 11:21 AM, Dmytriyenko,
      Denys wrote:<br>
    </div>
    <blockquote
      cite="mid:B0581B5571079145BA1CD78C126DBDE73222E69C@DLEE08.ent.ti.com"
      type="cite">
      <meta http-equiv="Content-Type" content="text/html;
        charset=windows-1252">
      <p dir="ltr">Unfortunately, that will make the resulting packages
        machine specific, which I want to avoid due to build issues
        we've had with gst 0.10...</p>
      <p dir="ltr">-- <br>
        Denys</p>
      <div class="gmail_quote">On Mar 26, 2015 05:59, "R, Karthik"
        <a class="moz-txt-link-rfc2396E" href="mailto:karthik.ramanan@ti.com">&lt;karthik.ramanan@ti.com&gt;</a> wrote:<br type="attribution">
        <blockquote class="quote" style="margin:0 0 0
          .8ex;border-left:1px #ccc solid;padding-left:1ex">
          <div><font size="2"><span style="font-size:10pt"></span></font>
            <div>* Make the feature additions specific to dra7xx due<br>
                 to the dependencies<br>
              <br>
              Signed-off-by: Karthik Ramanan <a class="moz-txt-link-rfc2396E" href="mailto:a0393906@ti.com">&lt;a0393906@ti.com&gt;</a><br>
              ---<br>
               .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    6
              ++++--<br>
               1 file changed, 4 insertions(+), 2 deletions(-)<br>
              <br>
              diff --git
              a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend
b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend<br>
              index b1cacac..72e67f5 100644<br>
              ---
a/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend<br>
              +++
b/meta-arago-extras/recipes-multimedia/gstreamer/gstreamer1.0-plugins-bad_1.2.3.bbappend<br>
              @@ -2,11 +2,13 @@ FILESEXTRAPATHS_prepend :=
              "${THISDIR}/${PN}:"<br>
               <br>
               PACKAGECONFIG = "faad wayland"<br>
               <br>
              -SRC_URI_append = " \<br>
              +DEPENDS_${PN}_append_dra7xx = " libdce libdrm"<br>
              +<br>
              +SRC_URI_append_dra7xx = " \<br>
                       <a class="moz-txt-link-freetext" href="file://0001-Added-GstDRMBufferPool-support.patch">file://0001-Added-GstDRMBufferPool-support.patch</a>
              \<br>
                      
              <a class="moz-txt-link-freetext" href="file://0002-Modified-waylandsink-to-accept-NV12-format.patch">file://0002-Modified-waylandsink-to-accept-NV12-format.patch</a>
              \<br>
                       <a class="moz-txt-link-freetext" href="file://0003-Added-KMSsink-support.patch">file://0003-Added-KMSsink-support.patch</a> \<br>
                      
              <a class="moz-txt-link-freetext" href="file://0004-waylandsink-Removed-dependency-on-dri2.patch">file://0004-waylandsink-Removed-dependency-on-dri2.patch</a> \<br>
                      
              <a class="moz-txt-link-freetext" href="file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch">file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch</a>"<br>
               <br>
              -PR_append = "-arago0"<br>
              +PR_append = "-arago1"<br>
              -- <br>
              1.7.9.5<br>
              <br>
              _______________________________________________<br>
              meta-arago mailing list<br>
              <a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a><br>
              <a moz-do-not-send="true"
                href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a><br>
            </div>
          </div>
        </blockquote>
      </div>
      <br>
      <fieldset class="mimeAttachmentHeader"></fieldset>
      <br>
      <pre wrap="">_______________________________________________
meta-arago mailing list
<a class="moz-txt-link-abbreviated" href="mailto:meta-arago@arago-project.org">meta-arago@arago-project.org</a>
<a class="moz-txt-link-freetext" href="http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago">http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------040306040702080309040403--
