Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAD7CD3436
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 11:23:48 +0000 (UTC)
Received: from BL0PR03CU003.outbound.protection.outlook.com (BL0PR03CU003.outbound.protection.outlook.com [52.101.53.2])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.12537.1777893822799121193
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 May 2026 04:23:43 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=CQ0erQC6;
 spf=pass (domain: ti.com, ip: 52.101.53.2, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NytH41Gnmaprp8atXbjs5Tcbgn3UK91vYuxP00qnQxWVSOZjoDw73EtGRLcfVK3ClPXHFKtH34sh9C2n8QUxGyHsuWQoV8GZbCwIh34rEhbzZNLuxiJ2B3uFIXgZvk4MNI6aXNQk35FhBLoxxf23zEDtk9cYEj1pHXWWLC05qv36yLHAgGM8OxHNFuq4TBcqeVHpyzvdI2edA+7jJfN0bO6w8AyY2dYq5u1ds6VeUtsuCFiKEWDWL11ViKtpIM4cMXRqJYmqObpWto5+gYNfG+Vzt1MUBg+vBbaQBHXV3lPEy+sMYFVYeU5p5O81uQtze8xssgiGjbA9muCZG1MjQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ckYCjFjKZovJgYyxdNyEpDF+lSXseZ+I6hCNMoePbRc=;
 b=uUIEl6g3l4dkMaTqFCaWt+EdJ1ha7WIbdhafe4YlLt8K8jdkPozjSsANQnYAhOK3Jtx9cWePbSGswEJ8/ICVGwsTeYYXbU+e3fN3BFy9rzqY3rn59ryLysvNdVAAT7SfetnCQmHKREw5zH0OGclAjq0r2LbnNWE7E9l9OX0TGoh0grY7Bk5bKAsAqZBLsmtAniwVk6puEcUUXcn9JQrBRFmZwh3xbrT3dLYJyEw5b5bxJAFZBTOqVjjn7Z2s6rYAuMZWtrdLJIWmfKTfOEZRujiVMa989a0DgxxgpZBgSzswveK6VP+H41AslTpf+RGW5+dg7pfcdYRuFYY4bg4F6w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.23.194) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ckYCjFjKZovJgYyxdNyEpDF+lSXseZ+I6hCNMoePbRc=;
 b=CQ0erQC6ZFbFuGScPz58/kE0skVkGLcqFpCcfGvQZERSd0Q0U8ABDtLIu3dA4A93uIpgQCdlnbTJC95xq6UY75ULh2iJsDpjVfVM2Bc1iINZecUxn2CYzSogI2pnP0I1Yq3pQduHUXwGhsW0ERkKjt1hjtpG4DSmK6dhnRFYUiY=
Received: from BN9PR03CA0367.namprd03.prod.outlook.com (2603:10b6:408:f7::12)
 by MW4PR10MB6299.namprd10.prod.outlook.com (2603:10b6:303:1e2::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 11:23:39 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:408:f7:cafe::c4) by BN9PR03CA0367.outlook.office365.com
 (2603:10b6:408:f7::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 11:23:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.23.194)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.23.194 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.23.194; helo=lewvzet200.ext.ti.com; pr=C
Received: from lewvzet200.ext.ti.com (198.47.23.194) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 11:23:38 +0000
Received: from DLEE213.ent.ti.com (157.170.170.116) by lewvzet200.ext.ti.com
 (10.4.14.103) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 06:23:37 -0500
Received: from DLEE210.ent.ti.com (157.170.170.112) by DLEE213.ent.ti.com
 (157.170.170.116) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 06:23:37 -0500
Received: from lelvem-mr06.itg.ti.com (10.180.75.8) by DLEE210.ent.ti.com
 (157.170.170.112) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 06:23:37 -0500
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr06.itg.ti.com (8.18.1/8.18.1) with ESMTP id 644BNY6Q608540;
	Mon, 4 May 2026 06:23:35 -0500
Content-Type: multipart/alternative;
	boundary="------------k1QhjioOuquynYsFLLEqbQ2N"
Message-ID: <87fa55b4-ea3d-4790-80c8-413993139b09@ti.com>
Date: Mon, 4 May 2026 16:53:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v 1/1] tensorflow-lite: Fix file
 packaging for headers and symlinks
From: Pratham Deshmukh <p-deshmukh@ti.com>
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
References: <20260423075408.1886225-1-p-deshmukh@ti.com>
 <20260423075408.1886225-2-p-deshmukh@ti.com>
 <20260427153537.GG4186@denix.org>
 <42b22397-721a-4d7c-a3e0-ab62ab86a537@ti.com>
 <20260501231424.GM4186@denix.org>
 <354277a4-59e8-4f9a-838d-4c73ddaccfab@ti.com>
Content-Language: en-US
In-Reply-To: <354277a4-59e8-4f9a-838d-4c73ddaccfab@ti.com>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|MW4PR10MB6299:EE_
X-MS-Office365-Filtering-Correlation-Id: 07317294-c155-4054-5a53-08dea9cf96fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|36860700016|376014|1800799024|13003099007|22082099003|18002099003|8096899003|56012099003;
X-Microsoft-Antispam-Message-Info: 
	UvkBnhMjlD6lskYVhb5eWgFb6Y+A2xMnrzvxjsXs1aoWGwpHOJcR72Mb3cHmfapWTTCUNEXYlpDkBJ62jWVnME6RsEJm+bjYetZaI3FgY/2UksR2hSG8shyZVW2GJi7PKMcWlaoQxMm/1RVjfWn1BpgKjGsgLtnG32nzjCT+0lvDGE9Y/ZGy2RBOTvcBTPyo5FIYtjlIYACLYfiBhEueVgSfY1twCr/HEDe0Uq1F1uQZ0KFGrEp4Mse7zgeQJIyXmtCjD6TWZRI3SM0aPPq5m2wuH5pLsnnrvgr7SRJSz315DLm/JxJzqgR7VtsFaFT7NU+a7DI4O1zGcII7fQG9C3d+FKcLWsT3ujgcCkyPfMcRsJwHm+rpBNuFtlV33NdL9M0thbJanVqoLAjxxCUFv/YPbXHj6CUyQ/jBA/XrxV57gQ3xGipfcXNWdCUaT/UF/zAD7samLQC62GZy/1zyPKPG/WGb2FiHVpHqIfsg+O8UGL9STeXIw7H1oU+pwGjTVmuxyVnHYF6n2PsZNYIh5/95t7OxiigkSXApmCR1jynaIQD0sTniq9U5kN7I7zp3bsSO0R8gmEhnGLsMS5L5+a/EBSiALZvVx9kJa8sZdL2qP7MA4FRBlxYe07VK6ZdY5HTHBvWFvR36p0PixM2uTXorbEHnFH29NXp9F/VPhIK9ZjMCePrzge63/cyosTpE
X-Forefront-Antispam-Report: 
	CIP:198.47.23.194;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:lewvzet200.ext.ti.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(36860700016)(376014)(1800799024)(13003099007)(22082099003)(18002099003)(8096899003)(56012099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	Ew2e8EHd5jxJPpUa01cSPmSSmKxaxKC9f0YRLORwz5a7DGx3xksbpheQrNrU+BYuUjRcuEzUiRGOwUBDMFcF5VyvF2J0V7GOkSqJr8J5KeSK4i96Jl8IFg4RWRalaQNcIBhT/Q0Y2ZOCLPC7+0Wsh3piM99ZwAgq8Vuxxny8/BEPlJYFvDlyuxhUj3StUaxX4zkARHxkGagm58TAu+4yD2xH6o++rvd8Db62dAQq4HjoEpnB3oCr5TnH9VsiIvq2DIzeV+IIOMMgXX/FiituV4T4ll2vIQalE7KdGhZHitd1Wv3b6eTWbtw8BD3GS0l5VaTUDtUVVUKA99Y+NN455nWIZm41++iLKT/z11qrR0diMWIXJVRM6AYjHkIKnM3BMoTZLJlno15FrrOTiBL/pV3vypGoxjoxZpRB3rID/2AZ4yRxqMRzsQcInAtWumJO
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 11:23:38.8462
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 07317294-c155-4054-5a53-08dea9cf96fd
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.23.194];Helo=[lewvzet200.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB6299
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 May 2026 11:23:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17514

--------------k1QhjioOuquynYsFLLEqbQ2N
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 04/05/26 4:50 pm, Pratham Deshmukh wrote:
>
> On 02/05/26 4:44 am, Denys Dmytriyenko wrote:
>> On Wed, Apr 29, 2026 at 02:05:38PM +0530, Pratham Deshmukh via lists.yoctoproject.org wrote:
>>> On 27/04/26 9:05 pm, Denys Dmytriyenko wrote:
>>>> On Thu, Apr 23, 2026 at 01:24:08PM +0530, Pratham Deshmukh via lists.yoctoproject.org wrote:
>>>>> The TensorFlow Lite recipe was missing proper packaging directives for
>>>>> development files, causing two issues:
>>>>>
>>>>> 1. Headers installed to ${includedir} were not being packaged into any
>>>>>     specific package, resulting in missing headers in the final rootfs
>>>>>     despite being built and installed correctly.
>>>>>
>>>>> 2. Unversioned .so symlinks (libtensorflow-lite.so, libtensorflowlite.so)
>>>>>     were incorrectly placed in the main runtime package instead of the
>>>>>     development package, triggering QA error [dev-so].
>>>>>
>>>>> Add FILES:${PN}-dev to properly assign development files:
>>>>>     - ${includedir}/* for TensorFlow Lite headers
>>>>>     - libdir}/lib*.so for unversioned shared library symlinks
>>>>>
>>>>> Signed-off-by: Pratham Deshmukh<p-deshmukh@ti.com>
>>>>> ---
>>>>>   .../tensorflow-lite/tensorflow-lite_2.20.0.bb                | 5 +++++
>>>>>   1 file changed, 5 insertions(+)
>>>>>
>>>>> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
>>>>> index 559ec5ef..75889b7e 100644
>>>>> --- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
>>>>> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
>>>>> @@ -229,6 +229,11 @@ FILES:${PN}-tools = " \
>>>>>       /opt/* \
>>>>>   "
>>>>> +FILES:${PN}-dev += " \
>>>>> +    ${includedir}/* \
>>>>> +    ${libdir}/lib*.so \
>>>> These are part of the defaults:
>>>> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n356
>>>>
>>>> I'm not sure your change even does anything here...
>>>>
>>> Hi Denys
>>>
>>> Thanks for the insights.
>>> Yes there's no need for these changes as it is already
>>>
>>> part of defaults.  Also, without these changes the headers are
>>>
>>> included in the rootfs. So this patch can be ignored/rejected.
>> This part I did not understand - normally you don't want the header files to
>> be included in the rootfs, only into the SDK...
>>
>> Can you please double-check this works as expected?
>>
> The reason is to support developing user-space applications related
>
> to TFLite directly on the target device. This provides additional 
> flexibility
>
> for users who want to compile and test TFLite-based applications
>
> on-target without solely relying on the SDK.
>
> The approach is implemented in the meta-tisdk layer [0]
>
> [0] https://github.com/TexasInstruments/meta-tisdk/pull/179
>
>
Attached incorrect patch link in the previous message. Please check the 
correct one [0]


[0] 
https://github.com/TexasInstruments/meta-tisdk/pull/173/changes#diff-50da8e5c6055ea370e9556e0ffed6bf9ac1e1331b5eecd6a3bd42f63f23294a6R5 

>>> Thanks & Regards,
>>> Pratham
>>>
>>>>> +"
>>>>> +
>>>>>   FILES:python3-${PN} = " \
>>>>>       ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
>>>>>       ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info \
>>>>> -- 
>>>>> 2.34.1
--------------k1QhjioOuquynYsFLLEqbQ2N
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>
</p>
    <div class="moz-cite-prefix">On 04/05/26 4:50 pm, Pratham Deshmukh
      wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:354277a4-59e8-4f9a-838d-4c73ddaccfab@ti.com">
      <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
      <p>
</p>
      <div class="moz-cite-prefix">On 02/05/26 4:44 am, Denys
        Dmytriyenko wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20260501231424.GM4186@denix.org">
        <pre wrap="" class="moz-quote-pre">On Wed, Apr 29, 2026 at 02:05:38PM +0530, Pratham Deshmukh via lists.yoctoproject.org wrote:
</pre>
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">On 27/04/26 9:05 pm, Denys Dmytriyenko wrote:
</pre>
          <blockquote type="cite">
            <pre wrap="" class="moz-quote-pre">On Thu, Apr 23, 2026 at 01:24:08PM +0530, Pratham Deshmukh via lists.yoctoproject.org wrote:
</pre>
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">The TensorFlow Lite recipe was missing proper packaging directives for
development files, causing two issues:

1. Headers installed to ${includedir} were not being packaged into any
   specific package, resulting in missing headers in the final rootfs
   despite being built and installed correctly.

2. Unversioned .so symlinks (libtensorflow-lite.so, libtensorflowlite.so)
   were incorrectly placed in the main runtime package instead of the
   development package, triggering QA error [dev-so].

Add FILES:${PN}-dev to properly assign development files:
   - ${includedir}/* for TensorFlow Lite headers
   - libdir}/lib*.so for unversioned shared library symlinks

Signed-off-by: Pratham Deshmukh <a class="moz-txt-link-rfc2396E"
              href="mailto:p-deshmukh@ti.com" moz-do-not-send="true">&lt;p-deshmukh@ti.com&gt;</a>
---
 .../tensorflow-lite/tensorflow-lite_2.20.0.bb                | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
index 559ec5ef..75889b7e 100644
--- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
+++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
@@ -229,6 +229,11 @@ FILES:${PN}-tools = " \
     /opt/* \
 "
+FILES:${PN}-dev += " \
+    ${includedir}/* \
+    ${libdir}/lib*.so \
</pre>
            </blockquote>
            <pre wrap="" class="moz-quote-pre">These are part of the defaults:
<a class="moz-txt-link-freetext"
href="https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n356"
            moz-do-not-send="true">https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n356</a>

I'm not sure your change even does anything here...

</pre>
          </blockquote>
          <pre wrap="" class="moz-quote-pre">Hi Denys

Thanks for the insights.
Yes there's no need for these changes as it is already

part of defaults.  Also, without these changes the headers are

included in the rootfs. So this patch can be ignored/rejected.
</pre>
        </blockquote>
        <pre wrap="" class="moz-quote-pre">This part I did not understand - normally you don't want the header files to 
be included in the rootfs, only into the SDK...

Can you please double-check this works as expected?

</pre>
      </blockquote>
      <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">The reason is to support developing user-space applications related </p>
      <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">to TFLite directly on the target device. This provides additional flexibility </p>
      <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">for users who want to compile and test TFLite-based applications </p>
      <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">on-target without solely relying on the SDK.</p>
      <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
      <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">The approach is implemented in the meta-tisdk layer [0]</p>
      <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">
</p>
      <p
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">[0] <a
      class="moz-txt-link-freetext"
      href="https://github.com/TexasInstruments/meta-tisdk/pull/179"
      moz-do-not-send="true">https://github.com/TexasInstruments/meta-tisdk/pull/179</a></p>
      <style type="text/css">p, li { white-space: pre-wrap; }</style><br>
    </blockquote>
    <p>Attached incorrect patch link in the previous message. Please check the correct one [0]</p>
    <br>
    [0]
<a class="moz-txt-link-freetext" href="https://github.com/TexasInstruments/meta-tisdk/pull/173/changes#diff-50da8e5c6055ea370e9556e0ffed6bf9ac1e1331b5eecd6a3bd42f63f23294a6R5">https://github.com/TexasInstruments/meta-tisdk/pull/173/changes#diff-50da8e5c6055ea370e9556e0ffed6bf9ac1e1331b5eecd6a3bd42f63f23294a6R5</a>
    <blockquote type="cite"
      cite="mid:354277a4-59e8-4f9a-838d-4c73ddaccfab@ti.com">
      <blockquote type="cite" cite="mid:20260501231424.GM4186@denix.org">
        <blockquote type="cite">
          <pre wrap="" class="moz-quote-pre">Thanks &amp; Regards,
Pratham

</pre>
          <blockquote type="cite">
            <blockquote type="cite">
              <pre wrap="" class="moz-quote-pre">+"
+
 FILES:python3-${PN} = " \
     ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
     ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info \
-- 
2.34.1
</pre>
            </blockquote>
          </blockquote>
        </blockquote>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------k1QhjioOuquynYsFLLEqbQ2N--

