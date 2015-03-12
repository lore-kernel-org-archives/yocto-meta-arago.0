Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id 28481529F8
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 03:27:03 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2C3R2xl027531
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 22:27:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C3R1W0009232
	for <meta-arago@arago-project.org>; Wed, 11 Mar 2015 22:27:01 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 11 Mar 2015 22:27:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2C3R0fe020950;
	Wed, 11 Mar 2015 22:27:00 -0500
Date: Wed, 11 Mar 2015 23:27:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150312032700.GH23587@edge>
References: <1425580304-19919-1-git-send-email-j-stiffler@ti.com>
	<1425580304-19919-2-git-send-email-j-stiffler@ti.com>
	<20150312020227.GG23587@edge>
	<131AB128-3D66-4FD9-A2BE-94D1EABE7F6B@ti.com>
MIME-Version: 1.0
In-Reply-To: <131AB128-3D66-4FD9-A2BE-94D1EABE7F6B@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [RFC v2 1/4] arago-prefs: Add WAYLAND_SUPPORT flag.
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
X-List-Received-Date: Thu, 12 Mar 2015 03:27:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Yeah, we are going to do distro feature per macghine/soc anyway for things 
like java/x11, so it's not a big issue...


On Wed, Mar 11, 2015 at 10:57:05PM -0400, Cooper Jr., Franklin wrote:
> Not including Wayland should only occur for 335x and 437x. AM57x should 
> still include Wayland.
> 
> If it is possible to filter things out based on machines/socs then I guess 
> using that approach is fine. However distro features seem like it should be 
> generic and not alter based on the soc.
> 
> But since X11 is set via distro features then it would make sense for 
> Wayland/Weston do the same. The soc specific changes makes it a bit messy...
> 
> 
> > On Mar 11, 2015, at 9:02 PM, Dmytriyenko, Denys <denys@ti.com> wrote:
> > 
> >> On Thu, Mar 05, 2015 at 01:31:40PM -0500, Jacob Stiffler wrote:
> >> * Default to "1" if QT_PROVIDER is not "qt4e".
> >> 
> >> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >> ---
> >> .../conf/distro/include/arago-prefs.inc            |    2 ++
> >> 1 file changed, 2 insertions(+)
> >> 
> >> diff --git a/meta-arago-distro/conf/distro/include/arago-prefs.inc b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> index e689f8b..a566437 100644
> >> --- a/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> +++ b/meta-arago-distro/conf/distro/include/arago-prefs.inc
> >> @@ -28,6 +28,8 @@ PREFERRED_PROVIDER_virtual/gettext = "gettext"
> >> ARAGO_QT_PROVIDER = "${@base_conditional('QT_PROVIDER','qt5','',base_contains('MACHINE_FEATURES','sgx','qt4-embedded-gles','qt4-embedded',d),d)}"
> >> PREFERRED_PROVIDER_qt4-embedded = "${ARAGO_QT_PROVIDER}"
> >> 
> >> +WAYLAND_SUPPORT ?= "${@base_conditional('QT_PROVIDER', 'qt4e', '0', '1', d)}"
> > 
> > So, as I mentioned on the call today, we should use "wayland" 
> > in DISTRO_FEATURES instead:
> > 
> > ${@base_contains('DISTRO_FEATURES', 'wayland', 'deps-for-wayland', 'deps-for-eglfs', d)}
> > 
> > 
> >> PREFERRED_VERSION_qt4-embedded = "4.8.5"
> >> PREFERRED_VERSION_qt4-native = "4.8.5"
> >> PREFERRED_VERSION_nativesdk-qt4-tools = "4.8.5"
> >> -- 
> >> 1.7.9.5
> >> 
> >> _______________________________________________
> >> meta-arago mailing list
> >> meta-arago@arago-project.org
> >> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

