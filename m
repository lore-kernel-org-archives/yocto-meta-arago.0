Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id CDFC952A98
	for <meta-arago@arago-project.org>;
	Tue,  3 May 2016 17:02:27 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id u43H2RGI017295
	for <meta-arago@arago-project.org>; Tue, 3 May 2016 12:02:27 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u43H2Rnf017527
	for <meta-arago@arago-project.org>; Tue, 3 May 2016 12:02:27 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 3 May 2016 12:02:27 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u43H2Rxg029769;
	Tue, 3 May 2016 12:02:27 -0500
Date: Tue, 3 May 2016 13:02:11 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20160503170211.GX1546@edge>
References: <57289E99.5000905@ti.com>
MIME-Version: 1.0
In-Reply-To: <57289E99.5000905@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: systemd
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
X-List-Received-Date: Tue, 03 May 2016 17:02:28 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 03, 2016 at 08:50:33AM -0400, Jacob Stiffler wrote:
> Hello,
> 
> With systemd recently enabled, I a wondering how to resolve when a
> package supports both systemd and sysvinit, but does not provide
> service files for every initscript it provides.
> 
> I am looking into busybox. It only provides systemd service files
> for syslog, but provides initscripts for other services such as
> udhcpd. By enabling the systemd distro feature and removing the
> sysvinit feature, all initscipts are removed from the installation,
> and thus services without systemd service files become unsupported.
> 
> Is there any way to resolve this without creating a udhcpd service
> file? Should sysvinit also be a DISTRO_FEATURE while the transistion
> to systemd is in progress?

Yeah, I was overzealous when disabling sysvinit from the DISTRO_FEATURES

Not all packages provide native systemd unit/service files and getting a 
pure systemd-only build would require some extra work. It is expected to 
use some of the old initscripts with systemd as a fallback, hence both 
DISTRO_FEATURES are still needed.

-- 
Denys

