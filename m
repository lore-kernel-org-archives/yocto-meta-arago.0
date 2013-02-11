Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 94AB1529D3
	for <meta-arago@arago-project.org>;
	Mon, 11 Feb 2013 20:11:31 +0000 (UTC)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r1BKBV2p005923
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 14:11:31 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id r1BKBV4O029486
	for <meta-arago@arago-project.org>; Mon, 11 Feb 2013 14:11:31 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 11 Feb 2013 14:11:30 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id r1BKBUdb023312;
	Mon, 11 Feb 2013 14:11:30 -0600
Date: Mon, 11 Feb 2013 15:11:30 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Zhou, Jingting" <zhoujt@ti.com>
Message-ID: <20130211201129.GC11440@edge>
References: <3C08AEEB3C731745938BC83D029FE5E39179EE@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <3C08AEEB3C731745938BC83D029FE5E39179EE@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: libdnet recipe for review?
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
X-List-Received-Date: Mon, 11 Feb 2013 20:11:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Feb 06, 2013 at 09:12:33PM +0000, Zhou, Jingting wrote:
> Hey all, attached is the patch for review. I commented out the
> 
> #FILES_${PN} += " ${libdir}/lib*.so"
> 
> Because the arago is complaining
> 
> ERROR: QA Issue: non -dev/-dbg/-nativesdk package contains symlink .so: 
> libdnet path 
> '/work/armv7a-vfp-neon-oe-linux-gnueabi/libdnet-1.12-r0/packages-split/libdnet/usr/lib/libdnet.so'

Yes, the above line was not correct in the first place and I explained it to 
you numerous times - you want to package the actual libraries with the mask 
lib*.so.* into the main package, while putting symlinks lib*.so into the -dev 
package for the devkit... Now the framework is just more strict and won't 
allow you to do that, unless you force it.

-- 
Denys

