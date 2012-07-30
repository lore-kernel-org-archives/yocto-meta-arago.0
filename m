Return-Path: <denis@denix.org>
Received: from vms173015pub.verizon.net (vms173015pub.verizon.net
	[206.46.173.15])
	by arago-project.org (Postfix) with ESMTP id 80AB252986
	for <meta-arago@arago-project.org>;
	Mon, 30 Jul 2012 22:45:25 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [96.240.136.247])
	by vms173015.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0M7Z00FS4WITJWW0@vms173015.mailsrvcs.net> for
	meta-arago@arago-project.org; Mon, 30 Jul 2012 17:45:09 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id C5248201CF; Mon,
	30 Jul 2012 18:44:53 -0400 (EDT)
Date: Mon, 30 Jul 2012 18:44:53 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20120730224453.GC11175@denix.org>
References: <8F29D6B095ED194EA1980491A5E029710C27A517@DFLE30.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C27A517@DFLE30.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [PATCHES] Porting Busybox from arago to meta-arago
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
X-List-Received-Date: Mon, 30 Jul 2012 22:45:26 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Jul 27, 2012 at 07:28:44PM +0000, Cooper Jr., Franklin wrote:
> The attached patches are for porting the amended recipe and file from arago 
> to meta-arago.
> 
> The patch 0002-busybox-Port-defconfig-changes-from-oe-classic takes the 
> default defconfig (http://goo.gl/L9dcd) in oe-core and tries to reapply the 
> configuration options that were in the old version (http://goo.gl/WFbNw)  
> located in the arago repository. Most of the effort was to ensure that 
> configuration options that were enabled previous were also enabled in this 
> updated defconfig file.
> 
> There were several options in the old defconfig that I couldn't find a 
> comparable option for in the new defconfig or I was simply unsure if they 
> were really equal:
> 
> Couldn't find in latest defconfig file in oe-core:
> CONFIG_FEATURE_DIFF_BINARY
> CONFIG_FEATURE_DIFF_MINIMAL
> CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_SIGHUP
> CONFIG_FEATURE_HTTPD_RELOAD_CONFIG_WITH_MIME_TYPES
> CONFIG_ASH_READ_NCHARS
> 
> Similar configuration names but not quite sure if they are indeed the same:
> CONFIG_ASH_READ_TIMEOUT - arago might be the same as CONFIG_ASH_IDLE_TIMEOUT 
> - oe-core
> 
> Are the above discrepancies ok to leave out or does anyone have suggestions 
> on how what to do with them?

Franklin,

The patches look fine, but do we need to port all the configuration options 
from Classic OE? We may only need few of them - should we instead identify the 
list of what is required and leave the rest of the descrepancy alone?

-- 
Denys

