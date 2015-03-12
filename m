Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8C48852A78
	for <meta-arago@arago-project.org>;
	Thu, 12 Mar 2015 14:00:17 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id t2CE0GYl023242
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:00:16 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CE0F7p027269
	for <meta-arago@arago-project.org>; Thu, 12 Mar 2015 09:00:15 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Thu, 12 Mar 2015 09:00:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t2CE0F6x008256;
	Thu, 12 Mar 2015 09:00:15 -0500
Date: Thu, 12 Mar 2015 10:00:14 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20150312140014.GD24885@edge>
References: <1426164957-22030-1-git-send-email-j-stiffler@ti.com>
	<1426164957-22030-4-git-send-email-j-stiffler@ti.com>
	<A2A3AF03-C549-41C8-B3A8-21E46E7BA19C@ti.com>
MIME-Version: 1.0
In-Reply-To: <A2A3AF03-C549-41C8-B3A8-21E46E7BA19C@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCH 3/4] arago.conf: Include wayland in DISTRO_FEATURES by default.
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
X-List-Received-Date: Thu, 12 Mar 2015 14:00:17 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Actually, it may be a good idea to adopt "screen" MACHINE_FEATURE globally for 
all things graphics (qt, sgx, wayland, etc.) - as currently we do it on 
per-machine/soc basis...


On Thu, Mar 12, 2015 at 01:20:14PM +0000, Cooper Jr., Franklin wrote:
> Honestly there is nothing technically wrong with depending on the screen but 
> I feel that it should be removed from this patchset.
> 
> As of now the machines that doesn't have the screen machine feature set 
> already avoids all the packagegroups that would end up Wayland and Weston.
> 
> If we want to universally pull in graphical packages based on the screen 
> machine feature then I think it would make sense to do it then when it is 
> actually going to do something.
> 
> 
> 
> 
> > On Mar 12, 2015, at 7:56 AM, Stiffler, Jacob <j-stiffler@ti.com> wrote:
> > 
> > * This is done conditional depending if 'screen' is a MACHINE_FEATURE.
> > 
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > ---
> > meta-arago-distro/conf/distro/arago.conf |    2 +-
> > 1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> > index 338d41b..1c14e6f 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -22,7 +22,7 @@ NO32LIBS = "0"
> > DISTRO_FEATURES = "alsa argp bluetooth ext2 irda largefile pcmcia usbgadget usbhost wifi xattr nfs zeroconf pci 3g ipv4 ipv6 pulseaudio ${DISTRO_FEATURES_LIBC}"
> > 
> > # Set additional distro features
> > -DISTRO_FEATURES += "pam"
> > +DISTRO_FEATURES += "pam ${@base_contains('MACHINE_FEATURES', 'screen', 'wayland', '', d)}"
> > 
> > # Set preferred Qt version
> > QT_PROVIDER ?= "qt5"
> > -- 
> > 1.7.9.5
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

