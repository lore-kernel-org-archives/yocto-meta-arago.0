Return-Path: <karthik.ramanan@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 72676529A9
	for <meta-arago@arago-project.org>;
	Fri, 27 Mar 2015 04:45:47 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2R4jj1c012651
	for <meta-arago@arago-project.org>; Thu, 26 Mar 2015 23:45:46 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2R4jgLQ008474
	for <meta-arago@arago-project.org>; Fri, 27 Mar 2015 10:15:43 +0530
Received: from [172.24.159.217] (172.24.159.217) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.224.2;
	Fri, 27 Mar 2015 10:15:41 +0530
Message-ID: <5514E075.6070200@ti.com>
Date: Fri, 27 Mar 2015 10:15:41 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.4.0
MIME-Version: 1.0
To: "Dmytriyenko, Denys" <denys@ti.com>, "R, Karthik" <karthik.ramanan@ti.com>
References: <B0581B5571079145BA1CD78C126DBDE73222E69C@DLEE08.ent.ti.com>
In-Reply-To: <B0581B5571079145BA1CD78C126DBDE73222E69C@DLEE08.ent.ti.com>
X-Originating-IP: [172.24.159.217]
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
X-List-Received-Date: Fri, 27 Mar 2015 04:45:47 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

With respect to the this package (GST plugins bad for 1.x), we have 
added support for KMS Sink, Wayland sink and GST DMA buffer pool support.

These inclusions have a dependency with libdrm and libdce.

I'm given to understand that for the AM3 and AM4, there is no libdrm 
support and there is no need for libdce as it is required to communicate 
with ipumm-fw. If we want to include the GST 1.x in the 
arago-tisdk-multimedia packagegroup then this change will help in making 
it buildable across all platforms (hopefully).

I referred to another recipe 
meta-arago-extras/recipes-qt/qt4/qt4-embedded-gles_4.8.5.bb which was 
doing something similar.

If this is not the preferred approach, I have an alternative in mind but 
I'm not sure if that will work - can we have a bbappend that is specific 
to a certain machine type?

Regards
Karthik

On 26-Mar-15 8:51 PM, Dmytriyenko, Denys wrote:
> Unfortunately, that will make the resulting packages machine specific,
> which I want to avoid due to build issues we've had with gst 0.10...
>
> --
> Denys
>
> On Mar 26, 2015 05:59, "R, Karthik" <karthik.ramanan@ti.com> wrote:
>
>     * Make the feature additions specific to dra7xx due
>         to the dependencies
>
>     Signed-off-by: Karthik Ramanan <a0393906@ti.com>
>     ---
>       .../gstreamer1.0-plugins-bad_1.2.3.bbappend        |    6 ++++--
>       1 file changed, 4 insertions(+), 2 deletions(-)
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
>       PACKAGECONFIG = "faad wayland"
>
>     -SRC_URI_append = " \
>     +DEPENDS_${PN}_append_dra7xx = " libdce libdrm"
>     +
>     +SRC_URI_append_dra7xx = " \
>               file://0001-Added-GstDRMBufferPool-support.patch \
>               file://0002-Modified-waylandsink-to-accept-NV12-format.patch \
>               file://0003-Added-KMSsink-support.patch \
>               file://0004-waylandsink-Removed-dependency-on-dri2.patch \
>               file://0005-vc1parse-and-jpegparse-Fixes-plugin-ranks.patch"
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


