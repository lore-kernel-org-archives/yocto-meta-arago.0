Return-Path: <j-stiffler@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id BB70852976
	for <meta-arago@arago-project.org>;
	Fri,  4 Dec 2015 16:54:42 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id tB4Gsfgj012220
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 10:54:41 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4Gsf0g017922
	for <meta-arago@arago-project.org>; Fri, 4 Dec 2015 10:54:41 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Fri, 4 Dec 2015 10:54:41 -0600
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id tB4Gsf1K007430	for
	<meta-arago@arago-project.org>; Fri, 4 Dec 2015 10:54:41 -0600
Message-ID: <5661C551.2030203@ti.com>
Date: Fri, 4 Dec 2015 11:54:41 -0500
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1449241270-6294-1-git-send-email-j-stiffler@ti.com>
	<1449241270-6294-5-git-send-email-j-stiffler@ti.com>
In-Reply-To: <1449241270-6294-5-git-send-email-j-stiffler@ti.com>
Subject: Re: [tisdk-setup-scripts][PATCH 4/5] setup-tftp: Copy pmmc-firmware if available
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
X-List-Received-Date: Fri, 04 Dec 2015 16:54:43 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Due to recent updates in u-boot, this patch will need to be reworked as 
the pmmc firmware name has been changed.

On 12/4/2015 10:01 AM, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>   setup-tftp.sh | 3 +++
>   1 file changed, 3 insertions(+)
>
> diff --git a/setup-tftp.sh b/setup-tftp.sh
> index 714968f..d675ba4 100644
> --- a/setup-tftp.sh
> +++ b/setup-tftp.sh
> @@ -159,6 +159,9 @@ copy_to_tftproot "$uboot_gph_files"
>   monfiles=`cd $prebuiltimagesdir;ls -1 skern*.bin 2> /dev/null`
>   copy_to_tftproot "$monfiles"
>   
> +pmmcfiles=`cd $prebuiltimagesdir;ls -1 pmmc*.bin 2> /dev/null`
> +copy_to_tftproot "$pmmcfiles"
> +
>   echo
>   if [ -f $tftpcfg ]; then
>       echo "$tftpcfg already exists.."


