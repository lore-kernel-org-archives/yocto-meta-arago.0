Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id F289752961
	for <meta-arago@arago-project.org>;
	Fri,  5 Apr 2013 22:56:17 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MKT00K5W112OWH3@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Fri, 05 Apr 2013 17:56:06 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id DAD44201C2; Fri,
	05 Apr 2013 18:55:49 -0400 (EDT)
Date: Fri, 05 Apr 2013 18:55:49 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Franklin S. Cooper Jr" <fcooper@ti.com>, meta-arago@arago-project.org
Message-id: <20130405225549.GF31233@denix.org>
References: <1364828207-28819-1-git-send-email-fcooper@ti.com>
	<1364828207-28819-2-git-send-email-fcooper@ti.com>
	<20130405184659.GD10072@edge>
MIME-version: 1.0
In-reply-to: <20130405184659.GD10072@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [PATCH 17/17 v2] arago.conf: Set PREFERRED_VERSIONs for Wilink 6 recipes
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
X-List-Received-Date: Fri, 05 Apr 2013 22:56:18 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Apr 05, 2013 at 02:47:00PM -0400, Denys Dmytriyenko wrote:
> On Mon, Apr 01, 2013 at 09:56:47AM -0500, Franklin S. Cooper Jr wrote:
> > * Currently two versions of Wilink 6 need to be supported.
> > * The latest version supports the PG 3 wilink 6 module which is the version that
> >   comes with the am37x-evm and am335x-evm .
> > * An older version supports the PG 2 wilink 6 module which is the version that
> >   comes with the am180x-evm.
> > * Specifying the PREFERRED_VERSION to match this requirement.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> > Version 2 changes:
> > None. Apart of new patchset.
> > 
> >  meta-arago-distro/conf/distro/arago.conf |   17 +++++++++++++++++
> >  1 files changed, 17 insertions(+), 0 deletions(-)
> > 
> > diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> > index 9e43ea3..44141c1 100644
> > --- a/meta-arago-distro/conf/distro/arago.conf
> > +++ b/meta-arago-distro/conf/distro/arago.conf
> > @@ -105,6 +105,23 @@ PREFERRED_VERSION_bluez-hcidump = "2.2"
> >  PREFERRED_VERSION_bash = "3.2.48"
> >  PREFERRED_VERSION_gettext = "0.16.1"
> >  
> > +# Support Wilink 6 PG 3 modules
> > +PREFERRED_VERSION_ti-compat-bluetooth = "r5.sp3.05"
> > +PREFERRED_VERSION_ti-compat-wireless-wl12xx = "r5.sp4.01"
> > +PREFERRED_VERSION_wl12xx-firmware = "r5.sp4.01"
> > +PREFERRED_VERSION_wpa-supplicant = "r5.sp4.01"
> > +PREFERRED_VERSION_hostap-daemon = "r5.sp4.01"
> > +PREFERRED_VERSION_ti-wifi-utils = "r5.sp3.05"
> > +
> > +# Support Wilink 6 PG 2 modules
> > +# By default am180x-evms come with an outdated wilink 6 module
> > +PREFERRED_VERSION_ti-compat-bluetooth_am180x-evm = "r5.00.18"
> > +PREFERRED_VERSION_ti-compat-wireless-wl12xx_am180x-evm = "r5.00.18"
> > +PREFERRED_VERSION_wl12xx-firmware_am180x-evm = "r5.00.18"
> > +PREFERRED_VERSION_wpa-supplicant_am180x-evm = "r5.00.18"
> > +PREFERRED_VERSION_hostap-daemon_am180x-evm = "r5.00.18"
> > +PREFERRED_VERSION_ti-wifi-utils_am180x-evm = "r5.00.18"
> 
> Ok, I've been thinking about this versioning model for some time - it's quite 
> ambiguous and can be a source of all kind of sorting problems. Here you set 
> preferred versions, which is good for the build. But from a package manager 
> it's unclear which one is preferred, moreover, if one is a clear upgrade path 
> for the other, or not... So, basically, there will be problems in the field 
> with this split and versioning of those packages. But I'm not sure if there's 
> a better way to handle this exception.

And another potential problem I see is that none of those packages are marked 
as machine-specific. In case there are other armv5te machines in the build, 
there will be a conflict between packages...

-- 
Denys

