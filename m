Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 615DF52CB3
	for <meta-arago@arago-project.org>;
	Tue, 20 Apr 2021 17:49:40 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 7AA6040C2A;
	Tue, 20 Apr 2021 17:50:06 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id KVF7iNV1D-jI; Tue, 20 Apr 2021 17:50:06 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 48B7A40B66;
	Tue, 20 Apr 2021 17:50:03 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id AB4311745C5; Tue, 20 Apr 2021 13:50:02 -0400 (EDT)
Date: Tue, 20 Apr 2021 13:50:02 -0400
From: Denys Dmytriyenko <denis@denix.org>
To: Aparna Balasubramanian <aparnab@ti.com>
Message-ID: <20210420175002.GO15937@denix.org>
References: <20210420164708.2562-1-aparnab@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210420164708.2562-1-aparnab@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: [master/dunfell PATCH] Rebase to ltp 20210121
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
X-List-Received-Date: Tue, 20 Apr 2021 17:49:40 -0000
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Apr 20, 2021 at 11:47:08AM -0500, Aparna Balasubramanian wrote:
> Update ltp to latest ltp tag 20210121

This won't work for dunfell, as it has version 20200120 of ltp. While 
hardknott/master have version 20210121 of ltp.


> Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
> ---
>  .../ltp-ddt/{ltp-ddt_20200120.bb => ltp-ddt_20210121.bb}      | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>  rename meta-arago-extras/recipes-devtools/ltp-ddt/{ltp-ddt_20200120.bb => ltp-ddt_20210121.bb} (94%)
> 
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210121.bb
> similarity index 94%
> rename from meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> rename to meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210121.bb
> index 7c9d50fd..db3e6a36 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20210121.bb
> @@ -11,10 +11,10 @@ PROVIDES += "ltp"
>  DEPENDS += "alsa-lib"
>  
>  PE = "1"
> -PR = "r13"
> +PR = "r0"
>  PV_append = "+git${SRCPV}"
>  
> -SRCREV = "31f9cfa61ae4102da6fa87f624130096c09d63a2"
> +SRCREV = "585fd7f640a9bc9fd77eec4991e097ba069908ea"
>  BRANCH ?= "master"
>  
>  SRC_URI_remove = "git://github.com/linux-test-project/ltp.git"
> -- 
> 2.17.1
> 

-- 
Regards,
Denys Dmytriyenko <denis@denix.org>
PGP: 0x420902729A92C964 - https://denix.org/0x420902729A92C964
Fingerprint: 25FC E4A5 8A72 2F69 1186  6D76 4209 0272 9A92 C964

