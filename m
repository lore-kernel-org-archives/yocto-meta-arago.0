Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id C7EC852998
	for <meta-arago@arago-project.org>;
	Tue,  9 Jul 2013 15:40:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r69FeIev030599
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 10:40:18 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r69FeIos012747
	for <meta-arago@arago-project.org>; Tue, 9 Jul 2013 10:40:18 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 9 Jul 2013 10:40:17 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r69FeHJo031008;
	Tue, 9 Jul 2013 10:40:17 -0500
Date: Tue, 9 Jul 2013 11:40:17 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Nelson, Sam" <sam.nelson@ti.com>
Message-ID: <20130709154017.GD14185@edge>
References: <4F9216F96E5DF9428610502835A9F49054937C49@DLEE11.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <4F9216F96E5DF9428610502835A9F49054937C49@DLEE11.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Karicheri,
	Muralidharan" <m-karicheri2@ti.com>, "Shilimkar,
	Santosh" <santosh.shilimkar@ti.com>
Subject: Re: Help needed: Devkit header files not upto date with kernel headers
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
X-List-Received-Date: Tue, 09 Jul 2013 15:40:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Jul 09, 2013 at 11:30:35AM -0400, Nelson, Sam wrote:
>    Hello all,
> 
>    The header files under sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi does
>    not match the same file from the kernel tree.

That's normal. There's a difference between kernel and user-space facing 
headers.

http://kernelnewbies.org/KernelHeaders


>    For example
> 
>    Comparing the following 2 files, they are different.
> 
>    sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/include/linux/ethtool.h
> 
>    and
> 
>    sysroots/armv7ahf-vfp-neon-oe-linux-gnueabi/usr/src/kernel/include/uapi/linux/ethtool.h
> 
>     
> 
>    Looking into some details, the /usr/include/linux/ethtool.h, seems to come
>    from the libc package.

Yes, those are different even on my host machine. The first is marked as 
_LINUX_ETHTOOL_H and the second one as _UAPI_LINUX_ETHTOOL_H

http://lwn.net/Articles/113349/
http://lwn.net/Articles/507794/


>    Any ideas on what can be wrong in the recipes will be helpful.  Is there
>    any way to update the user space header files to match the kernel header
>    files?

There is a special recipe for that - linux-libc-headers.

-- 
Denys

