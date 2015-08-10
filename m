Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 4635252A7E
	for <meta-arago@arago-project.org>;
	Mon, 10 Aug 2015 17:01:00 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t7AH0x5p010101
	for <meta-arago@arago-project.org>; Mon, 10 Aug 2015 12:00:59 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7AH0xs2019997
	for <meta-arago@arago-project.org>; Mon, 10 Aug 2015 12:00:59 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 10 Aug 2015 12:00:59 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t7AH0xSW015895;
	Mon, 10 Aug 2015 12:00:59 -0500
Date: Mon, 10 Aug 2015 13:00:43 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Devshatwar, Nikhil" <nikhil.nd@ti.com>
Message-ID: <20150810170043.GC30560@edge>
References: <1438704182-21056-1-git-send-email-j-stiffler@ti.com>
	<E60A9E1B4132A24DB80BD56ABC926847350B525E@DBDE04.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <E60A9E1B4132A24DB80BD56ABC926847350B525E@DBDE04.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH] gstreamer1.0-plugins-vpe: Add modprobe config	for ti-vip and ti-vpe
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
X-List-Received-Date: Mon, 10 Aug 2015 17:01:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Aug 05, 2015 at 09:55:57AM +0000, Devshatwar, Nikhil wrote:
> 
> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Stiffler, Jacob
> > Sent: Tuesday, August 04, 2015 9:33 PM
> > To: meta-arago@arago-project.org
> > Subject: [meta-arago] [PATCH] gstreamer1.0-plugins-vpe: Add modprobe config
> > for ti-vip and ti-vpe
> > 
> > * The module ti-vip and ti-vpe will use the device node /dev/video0
> >   and /dev/video1
> > * Which module gets which device node depends on the order they are
> >   inserted.
> > * The vpe gstreamer plugin has the assumption that ti-vpe is connected
> >   to /dev/video0
> > * This conf file will ensure that ti-vpe is inserted first, and gets
> >   node /dev/video0
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> >  .../gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-video.conf     |  1 +
> >  .../gst-plugins-ti/gstreamer1.0-plugins-vpe_git.bb            | 11 +++++++++--
> >  2 files changed, 10 insertions(+), 2 deletions(-)  create mode 100644 meta-
> > arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-plugins-vpe/ti-
> > video.conf
> > 
> > diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-
> > plugins-vpe/ti-video.conf b/meta-arago-extras/recipes-multimedia/gst-plugins-
> > ti/gstreamer1.0-plugins-vpe/ti-video.conf
> > new file mode 100644
> > index 0000000..339a0c1
> > --- /dev/null
> > +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-p
> > +++ lugins-vpe/ti-video.conf
> > @@ -0,0 +1 @@
> > +install ti-vip /sbin/modprobe ti-vpe; /sbin/modprobe --ignore-install
> > +ti-vip
> 
> This would work only if the VIP and VPE are compiled as modules
> Also, it won't work with if the USB camera registers a video device.
> The better way would be for plugin to not hard code the /dev/video0 device
> If you want to hard code the device name, it better be /dev/v4l/by-path/<the vpe platform device name>
> This won't change irrespective of other modules are there or not, and works 
> even in case VIP,VPE is compiled as builtin

Jake,

Do you plan to make changes suggested by Nikhil?

-- 
Denys


> > diff --git a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-
> > plugins-vpe_git.bb b/meta-arago-extras/recipes-multimedia/gst-plugins-
> > ti/gstreamer1.0-plugins-vpe_git.bb
> > index e549b3b..73a7723 100644
> > --- a/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-
> > plugins-vpe_git.bb
> > +++ b/meta-arago-extras/recipes-multimedia/gst-plugins-ti/gstreamer1.0-p
> > +++ lugins-vpe_git.bb
> > @@ -5,7 +5,14 @@ LIC_FILES_CHKSUM =
> > "file://COPYING;md5=fbc093901857fcd118f065f900982c24"
> > 
> >  require gstreamer1.0-plugins-ti.inc
> > 
> > -PR = "${INC_PR}.2"
> > +PR = "${INC_PR}.3"
> >  SRCREV = "876d28b2de5fa02d0f5fa836cba7be9a14b819eb"
> > 
> > -SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git"
> > +SRC_URI = "git://git.ti.com/glsdk/gst-plugin-vpe.git;protocol=git \
> > +           file://ti-video.conf \
> > +"
> > +
> > +do_install_append() {
> > +    install -d ${D}/etc/modprobe.d
> > +    install -m 644 ${WORKDIR}/ti-video.conf ${D}/etc/modprobe.d }
> > --
> > 1.9.1
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

