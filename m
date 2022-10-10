Return-Path: <praneeth@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D84EC433F5
	for <webhook@archiver.kernel.org>; Mon, 10 Oct 2022 22:32:26 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web12.864.1665441144868567889
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 10 Oct 2022 15:32:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FdKO9sSk;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: praneeth@ti.com)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 29AMWNnD080649
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Oct 2022 17:32:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1665441143;
	bh=GRgdEa10M8v1153T0RXoqKC9hfSnkuKV6yfP6RXJZDc=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FdKO9sSk+rL2N29F7XfNrUToLEG6PsPCxi+Ekiuv3YeEXYDho4sOds8nwGb7tvO0O
	 mR0130lcDwY8tGhyD0chU+1lQirwE6j9wODzk/W1czxszwBejDSfFj/QnQSksmrQii
	 5CbQVKATnc7f4Eg2ZMTq39ooMa2ubhpowZ8RmLek=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 29AMWNoN021787
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@lists.yoctoproject.org>; Mon, 10 Oct 2022 17:32:23 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6; Mon, 10
 Oct 2022 17:32:23 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.6 via
 Frontend Transport; Mon, 10 Oct 2022 17:32:23 -0500
Received: from [10.247.29.70] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 29AMWN0p004253;
	Mon, 10 Oct 2022 17:32:23 -0500
Message-ID: <0928849a-7b9c-bdc3-21f7-09f3d870336f@ti.com>
Date: Mon, 10 Oct 2022 17:32:23 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.1
Subject: Re: [[meta-arago][tisdk-setup-scripts][master][PATCH]] create-sdcard
 : Correct if condition which checks for boot images
Content-Language: en-US
To: Paresh Bhagat <p-bhagat@ti.com>, <meta-arago@lists.yoctoproject.org>,
        <reatmon@ti.com>
CC: <c-shilwant@ti.com>, <s-adivi@ti.com>
References: <20221010074049.13114-1-p-bhagat@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
In-Reply-To: <20221010074049.13114-1-p-bhagat@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 10 Oct 2022 22:32:26 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14063



On 10/10/2022 2:40 AM, Paresh Bhagat wrote:
> Jira - https://jira.itg.ti.com/browse/SITSW-1649

This is upstream mailing list.

Please keep the TI internal jira-ids away from commit descriptions or 
cover-letters please.

> 
> The if condition which checks for boot binaries for am65xx and
> j7 devices has no spaces which shows error while running create-sdcard.sh.
> Add the required spaces in if condition.
> 
> Signed-off-by: Paresh Bhagat <p-bhagat@ti.com>
> ---
>   create-sdcard.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index 4af6c94..5c3490a 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -1057,7 +1057,7 @@ if [ $BOOTPATHOPTION -eq 1 ] ; then
>   
>   	echo ""
>   	#copy boot files out of board support
> -        if ["$TARDEVICENAME" == "am65xx"] || ["$TARDEVICENAME" == "j7"]; then
> +        if [ "$TARDEVICENAME" == "am65xx" ] || [ "$TARDEVICENAME" == "j7" ]; then
>   		if [ "$MLO" == "" ] && ( [ "$SPL_R5" == "" ] || [ "$SPL_A53" == "" ] || [ "$SYSFW" == "" ] ); then
>   			echo "Boot image not found"
>   		fi

