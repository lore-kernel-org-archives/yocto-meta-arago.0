Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id D1BBE52BB9
	for <meta-arago@arago-project.org>;
	Wed, 25 Aug 2021 19:00:59 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id EE99340C6C;
	Wed, 25 Aug 2021 19:01:24 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id YidubNRdKm5w; Wed, 25 Aug 2021 19:01:24 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id D20B540A28;
	Wed, 25 Aug 2021 19:01:22 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 9F2A117466B; Wed, 25 Aug 2021 15:01:22 -0400 (EDT)
Date: Wed, 25 Aug 2021 15:01:22 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <20210825190122.GN1528@denix.org>
References: <1629833224-27240-1-git-send-email-denis@denix.org>
	<6d86176b-d4f5-4c6b-1df3-ac882fb28886@ti.com>
MIME-Version: 1.0
In-Reply-To: <6d86176b-d4f5-4c6b-1df3-ac882fb28886@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH] mbedtls: remove bbappend, change is upstream
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
X-List-Received-Date: Wed, 25 Aug 2021 19:01:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Yogesh,

It's a one-line commit message in the Subject.
Could break it into two lines, I guess...


On Wed, Aug 25, 2021 at 06:37:24AM -0500, Siraswar, Yogesh wrote:
> Denys,
> Commit message is empty, please provide some details.
> 
> Thanks
> Yogesh
> 
> On 8/24/2021 2:27 PM, Denys Dmytriyenko wrote:
> >From: Denys Dmytriyenko <denys@konsulko.com>
> >
> >Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> >---
> >  meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend | 1 -
> >  1 file changed, 1 deletion(-)
> >  delete mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> >
> >diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> >deleted file mode 100644
> >index 608377e..0000000
> >--- a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> >+++ /dev/null
> >@@ -1 +0,0 @@
> >-BBCLASSEXTEND = "native nativesdk"
> >
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

