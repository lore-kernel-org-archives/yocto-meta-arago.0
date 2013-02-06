Return-Path: <denis@denix.org>
Received: from vms173001pub.verizon.net (vms173001pub.verizon.net
	[206.46.173.1])
	by arago-project.org (Postfix) with ESMTP id 870F852A04
	for <meta-arago@arago-project.org>;
	Wed,  6 Feb 2013 03:53:14 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173001.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHS0081A5FUJ721@vms173001.mailsrvcs.net> for
	meta-arago@arago-project.org; Tue, 05 Feb 2013 21:52:58 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9F595200E2; Tue,
	05 Feb 2013 22:52:42 -0500 (EST)
Date: Tue, 05 Feb 2013 22:52:42 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Dmytriyenko, Denys" <denys@ti.com>
Message-id: <20130206035242.GA1341@denix.org>
References: <1360117678-4395-1-git-send-email-fcooper@ti.com>
	<1360117678-4395-2-git-send-email-fcooper@ti.com>
	<B0581B5571079145BA1CD78C126DBDE72E72EDB9@DLEE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <B0581B5571079145BA1CD78C126DBDE72E72EDB9@DLEE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>, "Cooper Jr.,
	Franklin" <fcooper@ti.com>
Subject: Re: [PATCH 2/4] nativesdk-qt4-tools: Use new native x11	package name.
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
X-List-Received-Date: Wed, 06 Feb 2013 03:53:14 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Wed, Feb 06, 2013 at 03:39:17AM +0000, Dmytriyenko, Denys wrote:
> Didn't I push this already? I remember fixing this particular one few days ago...

Ok, sorry, I didn't notice you were changing it back...

I did change it from libx11-nativesdk to nativesdk-libx11, because that's how 
BBCLASSEXTEND=nativesdk calls its packages now. Why are you changing it back?

-- 
Denys


> -----Original Message-----
> From: fcooperjr27@gmail.com [fcooperjr27@gmail.com]
> Received: Tuesday, 05 Feb 2013, 20:28
> To: meta-arago@arago-project.org [meta-arago@arago-project.org]
> CC: Cooper Jr., Franklin [fcooper@ti.com]
> Subject: [meta-arago] [PATCH 2/4] nativesdk-qt4-tools: Use new native x11 package name.
> 
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * Nativesdk-libx11 has now been renamed to libx11-nativesdk.
> * This ensure the x11 package is filtered out which prevents parsing/build
>   errors due to x11 not being a distro feature.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  .../qt4/nativesdk-qt4-tools_4.8.3.bbappend         |    4 ++--
>  1 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
> index 6296fbe..312571e 100644
> --- a/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
> +++ b/meta-arago-distro/recipes-qt/qt4/nativesdk-qt4-tools_4.8.3.bbappend
> @@ -1,7 +1,7 @@
> -PR_append = "-arago2"
> +PR_append = "-arago3"
> 
>  # Qt/E from Nokia is dual-licensed (LGPLv2.1 or GPLv3)
>  # For our distribution purposes we only use LGPLv2.1
>  LICENSE = "LGPLv2.1"
> 
> -DEPENDS := "${@oe_filter_out('nativesdk-libx11', '${DEPENDS}', d)}"
> +DEPENDS := "${@oe_filter_out('libx11-nativesdk', '${DEPENDS}', d)}"
> --
> 1.7.0.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


