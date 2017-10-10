Return-Path: <j-stiffler@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 97F50529A6
	for <meta-arago@arago-project.org>;
	Tue, 10 Oct 2017 13:41:19 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v9ADfJVn020341
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 08:41:19 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1507642879;
	bh=LdMWemIA8RzPf3ZAbdzlpM2KSYjhgMmmWbFxe/5BBfM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=KrBCj/xqjbiGDH5Yhm1lDbQs2VjSy4ZzfZEXwaIKjZLk8wreKVc+InDXLCbPwKkQG
	hDlKHGWjNhyWtSdZKn4GJH9DCyCR/d5KH0/yhRHvchNdm104akHN3Mct7ogV0iWTm1
	4jVH30/bArtlExaLADf01Ag+AYz37z9EL1BmhuhI=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9ADfJKa015350
	for <meta-arago@arago-project.org>; Tue, 10 Oct 2017 08:41:19 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P256) id 15.1.845.34;
	Tue, 10 Oct 2017 08:41:19 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.845.34 via Frontend
	Transport; Tue, 10 Oct 2017 08:41:19 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v9ADfI6Z005510;
	Tue, 10 Oct 2017 08:41:18 -0500
To: Manisha Agrawal <manisha.agrawal@ti.com>, <meta-arago@arago-project.org>
References: <20170908214951.29812-1-manisha.agrawal@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <fae65f80-93b6-ede3-fe67-a83401dc7947@ti.com>
Date: Tue, 10 Oct 2017 09:41:18 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.3.0
MIME-Version: 1.0
In-Reply-To: <20170908214951.29812-1-manisha.agrawal@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [meta-processor-sdk][PATCH v1] evse-hmi : SRCREV update
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
X-List-Received-Date: Tue, 10 Oct 2017 13:41:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Manisha,

Please submit this patch for meta-arago.


Thank you,

Jake


On 9/8/2017 5:49 PM, Manisha Agrawal wrote:
> Application fix for screen index. Set the index to 0 to always render
> Welcome screen first.
>
> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
> ---
>   recipes-apps/evse-hmi/evse-hmi_git.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/recipes-apps/evse-hmi/evse-hmi_git.bb b/recipes-apps/evse-hmi/evse-hmi_git.bb
> index 1bb66f5..114ba29 100755
> --- a/recipes-apps/evse-hmi/evse-hmi_git.bb
> +++ b/recipes-apps/evse-hmi/evse-hmi_git.bb
> @@ -10,7 +10,7 @@ PR = "r0"
>   BRANCH = "master"
>   SRC_URI = "git://git.ti.com/sitara-linux/evse-hmi.git;protocol=git;branch=${BRANCH}"
>   
> -SRCREV = "a257dfc05db311c74cb50838ff5b9e2cfb87dbfe"
> +SRCREV = "ce093e76faddce78dbaa3e22af6d252f57d5f700"
>   
>   S = "${WORKDIR}/git"
>   


