Return-Path: <karthik.ramanan@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id EAFA452995
	for <meta-arago@arago-project.org>;
	Wed, 10 Sep 2014 14:43:11 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8AEhANr032331
	for <meta-arago@arago-project.org>; Wed, 10 Sep 2014 09:43:10 -0500
Received: from DBDE72.ent.ti.com (dbdmailx.itg.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8AEh7AV028759
	for <meta-arago@arago-project.org>; Wed, 10 Sep 2014 20:13:09 +0530
Received: from [172.24.145.75] (172.24.145.75) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 10 Sep 2014 20:13:07 +0530
Message-ID: <5410637B.60706@ti.com>
Date: Wed, 10 Sep 2014 20:13:07 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1410352568-6319-1-git-send-email-yanivma@ti.com>
In-Reply-To: <1410352568-6319-1-git-send-email-yanivma@ti.com>
X-Originating-IP: [172.24.145.75]
Subject: Re: [PATCH] wl18xx: scripts: update scripts to match OOB configuration
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
X-List-Received-Date: Wed, 10 Sep 2014 14:43:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

Yaniv,

Is this a critical patch?

If it is, can I request you to post this patch on the dora branch also?

Regards
Karthik

On 10-Sep-14 6:06 PM, Yaniv Machani wrote:
> - Cleanup some redundant scripts
> - Change default path
> ---
>   .../wl18xx-target-scripts_r8.a9.14.bb              |    4 ++--
>   1 files changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> index 8ba0092..9ac3531 100644
> --- a/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> +++ b/meta-arago-extras/recipes-connectivity/wl18xx-target-scripts/wl18xx-target-scripts_r8.a9.14.bb
> @@ -2,10 +2,10 @@ DESCRIPTION = "Scripts and configuration files for TI wireless drivers"
>   LICENSE = "GPLv2"
>   LIC_FILES_CHKSUM = "file://README;beginline=1;endline=21;md5=b8d6a0865f50159bf5c0d175d1f4a705"
>
> -PR ="r1+gitr${SRCPV}"
> +PR ="r2+gitr${SRCPV}"
>
>   # Tag: ol_r8.a9.14
> -SRCREV = "4d9f47235501fb2c665b6336a54e0ba152e8e941"
> +SRCREV = "3a09bcf797ffe16a0d793e550caec9322a4e8027"
>   BRANCH = "sitara-mbss"
>   SRC_URI = "git://git.ti.com/wilink8-wlan/wl18xx-target-scripts.git;protocol=git;branch=${BRANCH}"
>
>



