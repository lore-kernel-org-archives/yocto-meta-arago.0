Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 0173852C88
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:36:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 0AE0240C56
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:36:31 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id RVbESRVc-aYR for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:36:31 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id EF8AB40AB7
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:36:30 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id A8D061745D3; Mon,  3 May 2021 17:36:30 -0400 (EDT)
Date: Mon, 3 May 2021 17:36:30 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: meta-arago@arago-project.org
Message-ID: <20210503213630.GF21867@denix.org>
References: <1611691726-9065-1-git-send-email-denis@denix.org>
MIME-Version: 1.0
In-Reply-To: <1611691726-9065-1-git-send-email-denis@denix.org>
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Re: [dunfell/master][PATCH] branding-*: remove remnants of u-boot-k3-r5
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
X-List-Received-Date: Mon, 03 May 2021 21:36:01 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Praneeth,

I noticed this patch has been merged to dunfell, but is missing on master.
Could you please cherry-pick this to master? Let me know if you need this 
rebased, as branding-core-next is gone now.


On Tue, Jan 26, 2021 at 03:08:46PM -0500, Denys Dmytriyenko wrote:
> u-boot-k3-r5 was deprecated some time ago by multiconfig support in meta-ti:
> http://arago-project.org/git/?p=meta-arago.git;a=commitdiff;h=7bd2c5d5fdf8cf0711e52454f76244373ee76d1d
> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>  meta-arago-distro/conf/distro/include/branding-bleeding.inc  | 1 -
>  meta-arago-distro/conf/distro/include/branding-core-next.inc | 1 -
>  2 files changed, 2 deletions(-)
> 
> diff --git a/meta-arago-distro/conf/distro/include/branding-bleeding.inc b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
> index 8b0811d..ca2aa9a 100644
> --- a/meta-arago-distro/conf/distro/include/branding-bleeding.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-bleeding.inc
> @@ -7,7 +7,6 @@ SRCREV_pn-linux-ti-staging = "${AUTOREV}"
>  SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
>  SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
>  SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
> -SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
>  SRCREV_pn-ltp-ddt = "${AUTOREV}"
>  #SRCREV_pn-optee-os = "${AUTOREV}"
>  #SRCREV_pn-optee-client = "${AUTOREV}"
> diff --git a/meta-arago-distro/conf/distro/include/branding-core-next.inc b/meta-arago-distro/conf/distro/include/branding-core-next.inc
> index e435e4f..f453b3c 100644
> --- a/meta-arago-distro/conf/distro/include/branding-core-next.inc
> +++ b/meta-arago-distro/conf/distro/include/branding-core-next.inc
> @@ -12,4 +12,3 @@ SRCREV_pn-linux-ti-staging = "${AUTOREV}"
>  SRCREV_pn-linux-ti-staging-rt = "${AUTOREV}"
>  SRCREV_pn-linux-ti-staging-systest = "${AUTOREV}"
>  SRCREV_pn-u-boot-ti-staging = "${AUTOREV}"
> -SRCREV_pn-u-boot-k3-r5 = "${AUTOREV}"
> -- 
> 2.7.4
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

