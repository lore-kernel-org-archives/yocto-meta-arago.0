Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 15EB252A2A;
	Wed, 19 Sep 2018 16:07:26 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8JG7IFx071880;
	Wed, 19 Sep 2018 11:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1537373238;
	bh=aMbUQpejJz39hRmE2eKvNRHj9LSHENmuniVPPR1lfbY=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=KzS5G+2uWnid+SeeOK+PSYGhmtGly8GR7JBexrMB3BYI7VFSyBGz79NKrEYILE0yq
	1w9hZC8WmaxKIB3vGt7Fp60Lbke+7448ieE33bEZFRCD2fhYbhQK2QJs/FvjuRPC9t
	cZgbW/6t12OzWQ7w4vSAQ50o/DJnF/1Gkpcb3gME=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JG7Igh006321;
	Wed, 19 Sep 2018 11:07:18 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Wed, 19 Sep 2018 11:07:18 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Wed, 19 Sep 2018 11:07:19 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8JG7Hok005886;
	Wed, 19 Sep 2018 11:07:18 -0500
To: "Nelson, Sam" <sam.nelson@ti.com>, "meta-arago@arago-project.org"
	<meta-arago@arago-project.org>, "arago-commits@arago-project.org"
	<arago-commits@arago-project.org>
References: <20180918004325.EB4B6529E6@arago-project.org>
	<cf6abb6401f94af4975dab1e0bf113b6@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <dfb776e3-b0fd-85aa-bf1e-81d9194f294f@ti.com>
Date: Wed, 19 Sep 2018 12:07:17 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <cf6abb6401f94af4975dab1e0bf113b6@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [arago-commits] Sam Nelson : ti-ipc: Update to new version 3.50.02.02
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
X-List-Received-Date: Wed, 19 Sep 2018 16:07:28 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US



On 9/18/2018 8:52 AM, Nelson, Sam wrote:
> Can this be backported this to 2018.03 as well?

ACK

> Thanks,
> Sam
>
>> -----Original Message-----
>> From: arago-commits-bounces@arago-project.org [mailto:arago-commits-
>> bounces@arago-project.org] On Behalf Of Arago Project git
>> Sent: Monday, September 17, 2018 8:43 PM
>> To: arago-commits@arago-project.org
>> Subject: [EXTERNAL] [arago-commits] Sam Nelson : ti-ipc: Update to new
>> version 3.50.02.02
>>
>> Module: meta-ti
>> Branch: rocko-next
>> Commit: 29b4c0210b20ab60cd21ad60a8bd75b1edfe8404
>> URL:    http://arago-project.org/git/meta-
>> ti.git?a=commit;h=29b4c0210b20ab60cd21ad60a8bd75b1edfe8404
>>
>> Author: Sam Nelson <sam.nelson@ti.com>
>> Date:   Sat Sep 15 08:24:28 2018 +0000
>>
>> ti-ipc: Update to new version 3.50.02.02
>>
>> Fixes backward compatibility issues for K2 and omapl138
>>
>> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>
>> ---
>>
>>   recipes-ti/ipc/ti-ipc-common.inc |    2 +-
>>   recipes-ti/ipc/ti-ipc-rtos.inc   |    4 ++--
>>   recipes-ti/ipc/ti-ipc.inc        |    4 ++--
>>   3 files changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-
>> common.inc
>> index 543990a..dddb734 100644
>> --- a/recipes-ti/ipc/ti-ipc-common.inc
>> +++ b/recipes-ti/ipc/ti-ipc-common.inc
>> @@ -1,4 +1,4 @@
>> -PV = "3.50.01.01"
>> +PV = "3.50.02.02"
>>   INC_PR = "r0"
>>
>>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
>> index 4b2d7d7..7378d42 100644
>> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
>> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
>> @@ -24,8 +24,8 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
>>   branch=${TI_IPC_METADATA_GIT_BRANCH};\
>>   name=${TI_IPC_METADATA_NAME}"
>>
>> -# Corresponds to tag: 3.50.01.01
>> -TI_IPC_METADATA_SRCREV =
>> "c749d4dd70cc259679dc862a164ad147d51381f6"
>> +# Corresponds to tag: 3.50.02.02
>> +TI_IPC_METADATA_SRCREV =
>> "171ed5b4cfc73fd2ebfeefe42249bec18f475613"
>>   # Corresponds to tag: 3.50.01.01
>>   TI_IPC_EXAMPLES_SRCREV =
>> "71f6e59a6b2c7e20c2656e5000f318339ded2f3c"
>>
>> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
>> index ca39292..230c7ef 100644
>> --- a/recipes-ti/ipc/ti-ipc.inc
>> +++ b/recipes-ti/ipc/ti-ipc.inc
>> @@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>>   TI_IPC_GIT_PROTOCOL = "git"
>>   TI_IPC_GIT_BRANCH = "3.50"
>>
>> -#Corresponds to 3.50.01.01
>> -TI_IPC_SRCREV = "771859b9687476c3ba1b5bf0d4afb3c97876137e"
>> +#Corresponds to 3.50.02.02
>> +TI_IPC_SRCREV = "c2bb741e4a2723155d38ede6a5a5dea8d6592089"
>>
>>   BRANCH = "${TI_IPC_GIT_BRANCH}"
>>   SRC_URI =
>> "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};
>> name=ipcdev"
>>
>> _______________________________________________
>> arago-commits mailing list
>> arago-commits@arago-project.org
>> http://arago-project.org/cgi-bin/mailman/listinfo/arago-commits
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


