Return-Path: <p-deshmukh@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45DB4FF885A
	for <webhook@archiver.kernel.org>; Mon,  4 May 2026 11:20:58 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com (SA9PR02CU001.outbound.protection.outlook.com [40.93.196.42])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.12411.1777893650511853264
 for <meta-arago@lists.yoctoproject.org>;
 Mon, 04 May 2026 04:20:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=selector1 header.b=WGffAJqC;
 spf=pass (domain: ti.com, ip: 40.93.196.42, mailfrom: p-deshmukh@ti.com)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ybr/6ibCoiB1CGZpLNQGQxC/E6KriPYrm1olKVBj/6XI1lNM+IBtCGdDvqJvR79jxKQZTumxFXcCSKNzhsKe6VvpXOT3BrQR9aZshi9DokwoA5ATipB7xnx5UgP6MIGic1TYtX3R+t0VoRD8z93uUin7XVKWZxnfr88ntryZyJ+CaJQerb+bOcl99m+j8Yv9QCI3J12KOb//lfZzogKC9oss88IlGhWfacZf367jwRp4uRF53P5ZWEjFQH0adJfHk+fGyMNq0YU8rMoutY5NvkO0iFqsIaURdhlhCLjfU1uj+7iPVc53nlyE2LP156MJOsx+CQJT0fxOi6Lmzs4NFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=m7H8q3QVXzJZs/2Sy0z5hWuaB8CuT5OI6owlH/Yif50=;
 b=Ubva6jwN1BdVl28YuX9AZXvGG4fBySPWH03SYDFR+1jj5OuGix5VdvT4xq6wWo7wEZnfIFHWGl4n3pvKfdC0T1YBdwLJQIHLdm9IF+Sd3t9vbnqGessO1CZ7QAVNmDJ3ZP61JOAq8EAlNSSuvlA1z5sk9k+IT1ianpFXPZKdXS/2z6m83C3U5265NZarYk0fKcnOx3xqJkOeuB6Zmm6/GrRu64CrGuC1dc7HusVkGseEeEZsV1BexVMS8RZhdSjC7kg6C0Q9TZG5O1+nWMzJdfkusB14epmqXT6RG5mIEBcwFYx9UmUupH4X3BFMonvLHlO/sc37YHrRq0rt6PMTfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 198.47.21.195) smtp.rcpttodomain=lists.yoctoproject.org smtp.mailfrom=ti.com;
 dmarc=pass (p=quarantine sp=none pct=100) action=none header.from=ti.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=m7H8q3QVXzJZs/2Sy0z5hWuaB8CuT5OI6owlH/Yif50=;
 b=WGffAJqCSLKy6uSRMPJ0ayXOkS4sA/5KXKTog/pmzXqOY+6vNbvCL4amZu6IYEJXuiCI1u5fHLQMoW8YhSMfrg44fBqSsVihi8REzRl8SYPcKwf9qf+G2D9O43oqs/fh5fxazvKcd7JcM0nmQy1hWn9pZI/l8WIt4DqaMZl2nrY=
Received: from IA1P220CA0021.NAMP220.PROD.OUTLOOK.COM (2603:10b6:208:464::14)
 by MN2PR10MB4223.namprd10.prod.outlook.com (2603:10b6:208:1dd::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9870.25; Mon, 4 May
 2026 11:20:47 +0000
Received: from BL6PEPF0002256E.namprd02.prod.outlook.com
 (2603:10b6:208:464:cafe::91) by IA1P220CA0021.outlook.office365.com
 (2603:10b6:208:464::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9870.25 via Frontend Transport; Mon,
 4 May 2026 11:20:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 198.47.21.195)
 smtp.mailfrom=ti.com; dkim=none (message not signed) header.d=none;dmarc=pass
 action=none header.from=ti.com;
Received-SPF: Pass (protection.outlook.com: domain of ti.com designates
 198.47.21.195 as permitted sender) receiver=protection.outlook.com;
 client-ip=198.47.21.195; helo=flwvzet201.ext.ti.com; pr=C
Received: from flwvzet201.ext.ti.com (198.47.21.195) by
 BL6PEPF0002256E.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9891.9 via Frontend Transport; Mon, 4 May 2026 11:20:46 +0000
Received: from DFLE211.ent.ti.com (10.64.6.69) by flwvzet201.ext.ti.com
 (10.248.192.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 06:20:45 -0500
Received: from DFLE205.ent.ti.com (10.64.6.63) by DFLE211.ent.ti.com
 (10.64.6.69) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 4 May
 2026 06:20:44 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DFLE205.ent.ti.com
 (10.64.6.63) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Mon, 4 May 2026 06:20:44 -0500
Received: from [172.24.233.101] (pratham-ti.dhcp.ti.com [172.24.233.101])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 644BKgk3887826;
	Mon, 4 May 2026 06:20:43 -0500
Content-Type: multipart/alternative;
	boundary="------------INzHFgJv31Uwpvn0kXQhOwDK"
Message-ID: <354277a4-59e8-4f9a-838d-4c73ddaccfab@ti.com>
Date: Mon, 4 May 2026 16:50:41 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][master][PATCH v 1/1] tensorflow-lite: Fix file
 packaging for headers and symlinks
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-arago@lists.yoctoproject.org>, <afd@ti.com>, <c-shilwant@ti.com>,
	<denys@ti.com>, <v-singh1@ti.com>
References: <20260423075408.1886225-1-p-deshmukh@ti.com>
 <20260423075408.1886225-2-p-deshmukh@ti.com>
 <20260427153537.GG4186@denix.org>
 <42b22397-721a-4d7c-a3e0-ab62ab86a537@ti.com>
 <20260501231424.GM4186@denix.org>
Content-Language: en-US
From: Pratham Deshmukh <p-deshmukh@ti.com>
In-Reply-To: <20260501231424.GM4186@denix.org>
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF0002256E:EE_|MN2PR10MB4223:EE_
X-MS-Office365-Filtering-Correlation-Id: 036da0ee-d3d3-4c1b-3c98-08dea9cf3038
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|376014|36860700016|82310400026|8096899003|18002099003|22082099003|56012099003|13003099007;
X-Microsoft-Antispam-Message-Info: 
	J4xqORbB9Zhj/l6qyAIL1kmlGkaCFzp1Zvkjx+xxFsnu4BoTBp5d3/w6kGdL5iUQa4/oxNBFfuxl78FI94THLnVlX1pDF8SM4WSxEjbdO9Jg2zk6Pp9zJijKw8BqtRDznFJB60H+1C9XXhIvxvnA1XsmpYXHcLO7CWaPp3aoKeZZxc8DufyrfjQpLZ5GyifB91/5q7AFNAHp/8d9FhAr6fgD165eIQzyNJI32Sh3ek78gusyFWd/kKFcDtB203co07Vjpk4yjArkwPJ7Q5sCDXz0hpfEH1ywSFvY8pGTN/v1QgsK6IjOL5ALdkq0vNbCgEu/Na4kw5HIgckWf6SyJ2Upl8mzqVllKy+lNMFczeIBvz0qO/Lj+eHQuGzdRF+HTTYRaWqMw7pNtGfE257mAcjgazNAzVHK5OeNZtRwDtEbYQ54OFvIVrmwp7lTxzxsojAOXADpBd1333s4ShJzgJwLAURBCSP3zTu4NzTGku170ja7taqkQ5J3fsuMIPrLTvBdcOwbRe6jsc4he/Yvfa4hrPUhGuekPbMF1FESgWc7kjh1rQwSymLeLwaFQ7Jycr1jtyOR9VOUxSyFjHQMYQq7wdkw59OsJ+O63Pg71XK6FwS6kNBaVykRwGJJLYj0bg10vYTpw/vwKzvXlBPbTH7g5q6e7vByilTcDn4SMb29LTCeqiZBghylP/HT647g
X-Forefront-Antispam-Report: 
	CIP:198.47.21.195;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:flwvzet201.ext.ti.com;PTR:ErrorRetry;CAT:NONE;SFS:(13230040)(1800799024)(376014)(36860700016)(82310400026)(8096899003)(18002099003)(22082099003)(56012099003)(13003099007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	5tCAXmHyOzFi6llSAtJImHFttBVRWENUF2Pfqqv++aNx29tOW3G8dkhhpcWYROkN7CxiZO40job00mdAE3mXJ18UwpflusViYgXxqvPpKqkXKFguRzUkynWHB1YGKDrawcE7dvk75548qfNly0VQycSy1OAxmmOtqesz0HKYgZrzzu+pCN8G6nWId/bPwTU5lzezXCXPCyJnkDJSzaBJN1aVKJ14TOGTbJ9jYZItpKXb+cCYXPc2II0zKDC/0LlqIv0IBB1NW8ki5SQizyqM7YVE2/HnYBu12zuNWZSrPUeD9EblgJ0B8r3LEaibXUhC3+wTz/vYyIHCJCDcGpi+8cecTxM8LOL4cpPKB7IzvOdLD5I/YaQ3HQy9U7JjRVHI/gFyhOXFtEsLZ8TzQUKTfxsxbcQRq4zgHST6CsHqutdYgEf8mZt+yf9IxgTWdSlH
X-OriginatorOrg: ti.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 May 2026 11:20:46.4305
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 036da0ee-d3d3-4c1b-3c98-08dea9cf3038
X-MS-Exchange-CrossTenant-Id: e5b49634-450b-4709-8abb-1e2b19b982b7
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=e5b49634-450b-4709-8abb-1e2b19b982b7;Ip=[198.47.21.195];Helo=[flwvzet201.ext.ti.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF0002256E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR10MB4223
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Mon, 04 May 2026 11:20:58 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/17513

--------------INzHFgJv31Uwpvn0kXQhOwDK
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit

On 02/05/26 4:44 am, Denys Dmytriyenko wrote:
> On Wed, Apr 29, 2026 at 02:05:38PM +0530, Pratham Deshmukh via lists.yoctoproject.org wrote:
>> On 27/04/26 9:05 pm, Denys Dmytriyenko wrote:
>>> On Thu, Apr 23, 2026 at 01:24:08PM +0530, Pratham Deshmukh via lists.yoctoproject.org wrote:
>>>> The TensorFlow Lite recipe was missing proper packaging directives for
>>>> development files, causing two issues:
>>>>
>>>> 1. Headers installed to ${includedir} were not being packaged into any
>>>>     specific package, resulting in missing headers in the final rootfs
>>>>     despite being built and installed correctly.
>>>>
>>>> 2. Unversioned .so symlinks (libtensorflow-lite.so, libtensorflowlite.so)
>>>>     were incorrectly placed in the main runtime package instead of the
>>>>     development package, triggering QA error [dev-so].
>>>>
>>>> Add FILES:${PN}-dev to properly assign development files:
>>>>     - ${includedir}/* for TensorFlow Lite headers
>>>>     - libdir}/lib*.so for unversioned shared library symlinks
>>>>
>>>> Signed-off-by: Pratham Deshmukh<p-deshmukh@ti.com>
>>>> ---
>>>>   .../tensorflow-lite/tensorflow-lite_2.20.0.bb                | 5 +++++
>>>>   1 file changed, 5 insertions(+)
>>>>
>>>> diff --git a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
>>>> index 559ec5ef..75889b7e 100644
>>>> --- a/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
>>>> +++ b/meta-arago-extras/recipes-framework/tensorflow-lite/tensorflow-lite_2.20.0.bb
>>>> @@ -229,6 +229,11 @@ FILES:${PN}-tools = " \
>>>>       /opt/* \
>>>>   "
>>>> +FILES:${PN}-dev += " \
>>>> +    ${includedir}/* \
>>>> +    ${libdir}/lib*.so \
>>> These are part of the defaults:
>>> https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n356
>>>
>>> I'm not sure your change even does anything here...
>>>
>> Hi Denys
>>
>> Thanks for the insights.
>> Yes there's no need for these changes as it is already
>>
>> part of defaults.  Also, without these changes the headers are
>>
>> included in the rootfs. So this patch can be ignored/rejected.
> This part I did not understand - normally you don't want the header files to
> be included in the rootfs, only into the SDK...
>
> Can you please double-check this works as expected?
>
The reason is to support developing user-space applications related

to TFLite directly on the target device. This provides additional 
flexibility

for users who want to compile and test TFLite-based applications

on-target without solely relying on the SDK.

The approach is implemented in the meta-tisdk layer [0]

[0] https://github.com/TexasInstruments/meta-tisdk/pull/179


>> Thanks & Regards,
>> Pratham
>>
>>>> +"
>>>> +
>>>>   FILES:python3-${PN} = " \
>>>>       ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime \
>>>>       ${PYTHON_SITEPACKAGES_DIR}/tflite_runtime.egg-info \
>>>> -- 
>>>> 2.34.1
--------------INzHFgJv31Uwpvn0kXQhOwDK
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
    <div class="moz-cite-prefix">On 02/05/26 4:44 am, Denys Dmytriyenko
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20260501231424.GM4186@denix.org">
      <pre wrap="" class="moz-quote-pre">On Wed, Apr 29, 2026 at 02:05:38PM +0530, Pratham Deshmukh via lists.yoctoproject.org wrote:
</pre>
      <blockquote type="cite">
        <pre wrap="" class="moz-quote-pre">
On 27/04/26 9:05 pm, Denys Dmytriyenko wrote:
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

Signed-off-by: Pratham Deshmukh <a class="moz-txt-link-rfc2396E" href="mailto:p-deshmukh@ti.com">&lt;p-deshmukh@ti.com&gt;</a>
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
<a class="moz-txt-link-freetext" href="https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n356">https://git.openembedded.org/openembedded-core/tree/meta/conf/bitbake.conf#n356</a>

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
      <pre wrap="" class="moz-quote-pre">
This part I did not understand - normally you don't want the header files to 
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
style=" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;">[0] <a class="moz-txt-link-freetext" href="https://github.com/TexasInstruments/meta-tisdk/pull/179">https://github.com/TexasInstruments/meta-tisdk/pull/179</a></p>
    <style type="text/css">p, li { white-space: pre-wrap; }</style><br>
    <blockquote type="cite" cite="mid:20260501231424.GM4186@denix.org">
      <pre wrap="" class="moz-quote-pre">
</pre>
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
  </body>
</html>

--------------INzHFgJv31Uwpvn0kXQhOwDK--

