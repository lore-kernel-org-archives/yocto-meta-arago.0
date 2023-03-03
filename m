Return-Path: <rs@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C04BBC64EC4
	for <webhook@archiver.kernel.org>; Fri,  3 Mar 2023 21:11:56 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.508.1677877908004100862
 for <meta-arago@lists.yoctoproject.org>;
 Fri, 03 Mar 2023 13:11:48 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=TbUnDY9s;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: rs@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 323LBh7S086470;
	Fri, 3 Mar 2023 15:11:43 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1677877903;
	bh=RVeISE1UQoZqQAh5N8hAUfYJjOz1aODOKNxpPh12LvU=;
	h=Date:From:Subject:To:CC:In-Reply-To:References;
	b=TbUnDY9sEFOogfafvlaom4JOCiqNJsUUeMDIE3cbwGyDAorlMsDC10GaeE7P2Cz4E
	 IKqGIWNDsO6x0V3aY7bmGoNNm584iynekrACbjANiX6OGpXG0dWy5gyBPJjDz0xNKD
	 XigvqNd+bkcOhQzjv/kgWFleKIT2XTNEMz5NKiGg=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 323LBhET020674
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 3 Mar 2023 15:11:43 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
 (10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 3
 Mar 2023 15:11:43 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 3 Mar 2023 15:11:42 -0600
Received: from res-desktop (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 323LBgS4010148;
	Fri, 3 Mar 2023 15:11:42 -0600
Date: Fri, 3 Mar 2023 15:11:37 -0600
From: "Sapp, Randolph" <rs@ti.com>
Subject: Re: [EXTERNAL] Re: [meta-arago] [master/kirkstone][PATCH 2/2] weston:
 drop patch reverting GL_EXT_unpack_subimage requirement
To: <reatmon@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Andrew Davis <afd@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Message-ID: <DVQYQR.XGNQ2Y3LNBQN3@ti.com>
In-Reply-To: <9ef3c722-3186-5172-3592-6b5d2aa76f88@ti.com>
References: <20230224101240.4132411-1-denis@denix.org>
	<20230224101240.4132411-2-denis@denix.org>
	<a328ae4f-51af-000d-17d8-8e2889462ee2@ti.com>
	<20230228232943.GM22689@denix.org>
	<654a4a43-ece4-feb2-85ac-b0ce5cf38211@ti.com>
	<20230301001519.GO22689@denix.org>
	<17485370DD88972D.13840@lists.yoctoproject.org>
	<9ef3c722-3186-5172-3592-6b5d2aa76f88@ti.com>
X-Mailer: geary/43.0
MIME-Version: 1.0
Content-Type: multipart/alternative; boundary="=-euXYxUvIzjsr72M1m4w7"
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Fri, 03 Mar 2023 21:11:56 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/14249

--=-euXYxUvIzjsr72M1m4w7
Content-Type: text/plain; charset="us-ascii"; format=flowed

If SGX patches are stalling builds drop them. I'll add them back in 
when we get SGX fully functional. I don't see all of these patches 
being necessary now that my pvr-dri work has been approved. It'll make 
more sense to pull them as we need them later.

On Wed, Mar 1 2023 at 13:27:34 -06:00:00, Ryan Eatmon via 
lists.yoctoproject.org <reatmon=ti.com@lists.yoctoproject.org> wrote:
> 
> And now for a fun development, the patch in question no longer 
> applies cleanly on master...
> 
> 
> On 3/1/2023 8:56 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
>> 
>> 
>> On 2/28/2023 6:15 PM, Denys Dmytriyenko wrote:
>>> On Tue, Feb 28, 2023 at 05:57:40PM -0600, Andrew Davis wrote:
>>>> On 2/28/23 5:29 PM, Denys Dmytriyenko wrote:
>>>>> On Fri, Feb 24, 2023 at 08:16:25AM -0600, Andrew Davis via 
>>>>> lists.yoctoproject.org wrote:
>>>>>> On 2/24/23 4:12 AM, Denys Dmytriyenko wrote:
>>>>>>> From: Denys Dmytriyenko <denys@konsulko.com 
>>>>>>> <mailto:denys@konsulko.com>>
>>>>>>> 
>>>>>>> With the updated graphics recipes in meta-ti this hack is no 
>>>>>>> longer needed.
>>>>>> 
>>>>>> Did you test that? What board and with what program?
>>>>> 
>>>>> If I remember correctly, there was a build failure in the past 
>>>>> with newer
>>>>> Weston complaining that the extenstion does not exist in the old 
>>>>> binary DDK.
>>>>> Since I haven't seen this failure with the updated Mesa-based 
>>>>> graphics stack,
>>>>> I assumed that is now resolved.
>>>>> 
>>>>> My testing was mostly with Rogue and I see in the commit log that 
>>>>> this is
>>>>> specific to SGX, which currently builds full software-rendering 
>>>>> stack w/o any
>>>>> HW acceleration.
>>>>> 
>>>>> Is this extension a pure software implementation in Mesa or does 
>>>>> it require
>>>>> corresponding HW support? If the latter, then we definitely still 
>>>>> need this
>>>>> revert and my patch removing it can be dropped.
>>>>> 
>>>> 
>>>> Unfortunately it needs to be handled in the GPU driver on the UM 
>>>> side, so
>>>> not something Mesa can fix for us. And the error only shows up as 
>>>> a runtime
>>>> issue when you try to start Weston and it sees the extension is 
>>>> not available.
>>>> 
>>>> We will need to keep this patch until someone can add the software 
>>>> emulation
>>>> of this function inside the SGX UM driver. It is on my todo list 
>>>> for someday..
>>> 
>>> Andrew,
>>> 
>>> Thanks for confirming.
>>> 
>>> Ryan,
>>> 
>>> We still need Andrew's revert, please drop my patch from the queue. 
>>> Thanks.
>> 
>> Roger that.
>> 
>> 
> 
> --
> Ryan Eatmon                reatmon@ti.com <mailto:reatmon@ti.com>
> -----------------------------------------
> Texas Instruments, Inc.  -  LCPD  -  MGTS
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#14242): 
> <https://lists.yoctoproject.org/g/meta-arago/message/14242>
> Mute This Topic: <https://lists.yoctoproject.org/mt/97203204/7094281>
> Group Owner: meta-arago+owner@lists.yoctoproject.org 
> <mailto:meta-arago+owner@lists.yoctoproject.org>
> Unsubscribe: 
> <https://lists.yoctoproject.org/g/meta-arago/leave/11554122/7094281/459377185/xyzzy> 
> [rs@ti.com <mailto:rs@ti.com>]
> -=-=-=-=-=-=-=-=-=-=-=-
> 
> 


--=-euXYxUvIzjsr72M1m4w7
Content-Type: text/html; charset="us-ascii"

<div id="geary-body" dir="auto"><div>If SGX patches are stalling builds drop them. I'll add them back in when we get SGX fully functional. I don't see all of these patches being necessary now that my pvr-dri work has been approved. It'll make more sense to pull them as we need them later.</div></div><div id="geary-quote" dir="auto"><br>On Wed, Mar 1 2023 at 13:27:34 -06:00:00, Ryan Eatmon via lists.yoctoproject.org &lt;reatmon=ti.com@lists.yoctoproject.org&gt; wrote:<br><blockquote type="cite"><div class="plaintext" style="white-space: break-spaces;">
And now for a fun development, the patch in question no longer applies cleanly on master...


On 3/1/2023 8:56 AM, Ryan Eatmon via lists.yoctoproject.org wrote:
<blockquote>

On 2/28/2023 6:15 PM, Denys Dmytriyenko wrote:
<blockquote>On Tue, Feb 28, 2023 at 05:57:40PM -0600, Andrew Davis wrote:
<blockquote>On 2/28/23 5:29 PM, Denys Dmytriyenko wrote:
<blockquote>On Fri, Feb 24, 2023 at 08:16:25AM -0600, Andrew Davis via lists.yoctoproject.org wrote:
<blockquote>On 2/24/23 4:12 AM, Denys Dmytriyenko wrote:
<blockquote>From: Denys Dmytriyenko &lt;<a href="mailto:denys@konsulko.com">denys@konsulko.com</a>&gt;

With the updated graphics recipes in meta-ti this hack is no longer needed.
</blockquote>
Did you test that? What board and with what program?
</blockquote>
If I remember correctly, there was a build failure in the past with newer
Weston complaining that the extenstion does not exist in the old binary DDK.
Since I haven't seen this failure with the updated Mesa-based graphics stack,
I assumed that is now resolved.

My testing was mostly with Rogue and I see in the commit log that this is
specific to SGX, which currently builds full software-rendering stack w/o any
HW acceleration.

Is this extension a pure software implementation in Mesa or does it require
corresponding HW support? If the latter, then we definitely still need this
revert and my patch removing it can be dropped.

</blockquote>
Unfortunately it needs to be handled in the GPU driver on the UM side, so
not something Mesa can fix for us. And the error only shows up as a runtime
issue when you try to start Weston and it sees the extension is not available.

We will need to keep this patch until someone can add the software emulation
of this function inside the SGX UM driver. It is on my todo list for someday..
</blockquote>
Andrew,

Thanks for confirming.

Ryan,

We still need Andrew's revert, please drop my patch from the queue. Thanks.
</blockquote>
Roger that.


</blockquote>
<div>-- 
</div>Ryan Eatmon                <a href="mailto:reatmon@ti.com">reatmon@ti.com</a>
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#14242): <a href="https://lists.yoctoproject.org/g/meta-arago/message/14242">https://lists.yoctoproject.org/g/meta-arago/message/14242</a>
Mute This Topic: <a href="https://lists.yoctoproject.org/mt/97203204/7094281">https://lists.yoctoproject.org/mt/97203204/7094281</a>
Group Owner: <a href="mailto:meta-arago+owner@lists.yoctoproject.org">meta-arago+owner@lists.yoctoproject.org</a>
Unsubscribe: <a href="https://lists.yoctoproject.org/g/meta-arago/leave/11554122/7094281/459377185/xyzzy">https://lists.yoctoproject.org/g/meta-arago/leave/11554122/7094281/459377185/xyzzy</a> [<a href="mailto:rs@ti.com">rs@ti.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-


</div></blockquote></div>
--=-euXYxUvIzjsr72M1m4w7--

