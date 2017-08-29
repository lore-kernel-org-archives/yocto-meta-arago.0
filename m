Return-Path: <e-ruei1@ti.com>
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by arago-project.org (Postfix) with ESMTPS id 981E252AB8
	for <meta-arago@arago-project.org>;
	Tue, 29 Aug 2017 18:12:49 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id v7TICnsT029266
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 13:12:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1504030369;
	bh=vpOQaGweDjsxvNsbtgkvHDHP9b3umJfH+5soTP0UkVY=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=b7toA+MPwSSB8xTIeQyNpQc22PlnCSgDKEVB/wh0owba/hIlSgsrb+OF53ID0+BnZ
	9G3eqkpRq0/upmvPrWNLeSZA4ZsLTMgTfguL9M7AyHPb8D2YHPDKppvDhQKEp2fUF+
	dd8D0mFLANorDgASxQylFNOLVDmF+IMazvrvZnpo=
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v7TICnlE006718
	for <meta-arago@arago-project.org>; Tue, 29 Aug 2017 13:12:49 -0500
Received: from [158.218.103.39] (158.218.103.39) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 29 Aug 2017 13:12:48 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1504022753-20132-1-git-send-email-e-ruei1@ti.com>
	<1504022753-20132-2-git-send-email-e-ruei1@ti.com>
	<20170829161745.GC8304@edge>
	<68c499e4-1b3e-3cf8-a023-3059ae7d16e8@ti.com>
	<20170829174810.GJ8304@edge>
From: "Ruei, Eric" <a0850410@ti.com>
Message-ID: <69d759cb-3483-8424-5214-e909573bfb13@ti.com>
Date: Tue, 29 Aug 2017 14:12:47 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.2.1
MIME-Version: 1.0
In-Reply-To: <20170829174810.GJ8304@edge>
X-Originating-IP: [158.218.103.39]
Cc: meta-arago@arago-project.org
Subject: Re: [morty/master][PATCH 2/2] matrix-gui-apps-git: bump SRCREV for changes and additions
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
X-List-Received-Date: Tue, 29 Aug 2017 18:12:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

On 8/29/2017 1:48 PM, Denys Dmytriyenko wrote:
> On Tue, Aug 29, 2017 at 01:33:11PM -0400, Ruei, Eric wrote:
>> On 8/29/2017 12:17 PM, Denys Dmytriyenko wrote:
>>> Eric,
>>>
>>> On Tue, Aug 29, 2017 at 12:05:53PM -0400, Eric Ruei wrote:
>>>> * replace webkit-based browsers with the webengine-based ones
>>>> * add HMI EVSE demo
>>>
>>> This hasn't been merged yet - see my comments yesterday.
>>>
>>>
>> Which one do you mean? Both of them are pushed at matrix-gui-v2-apps?
> 
> HMI EVSE
> 
> 
I see Manisha's new patch also include matrix-gui-apps-git. Therefore, I 
should update this patch on top of hers, right?



>>>> Signed-off-by: Eric Ruei <e-ruei1@ti.com>
>>>> Signed-off-by: Manisha Agrawal <manisha.agrawal@ti.com>
>>>> ---
>>>>   meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc | 4 ++--
>>>>   1 file changed, 2 insertions(+), 2 deletions(-)
>>>>
>>>> diff --git a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>>>> index b805f5e..4d74224 100644
>>>> --- a/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>>>> +++ b/meta-arago-extras/recipes-core/matrix/matrix-gui-apps-git.inc
>>>> @@ -4,9 +4,9 @@ LICENSE_CHECKSUM = "LICENSE;md5=6e0ae7214f6c74c149cb25f373057fa9"
>>>>   LIC_FILES_CHKSUM := "file://../${LICENSE_CHECKSUM}"
>>>>   SRC_URI = "git://git.ti.com/matrix-gui-v2/matrix-gui-v2-apps.git;protocol=git;branch=${BRANCH}"
>>>> -SRCREV = "38afccb5335216ececa874cf4cf72a67c4164fc3"
>>>> +SRCREV = "d910584814644f853f3fe4fbe715f674f24b9bd3"
>>>>   BRANCH = "master"
>>>> -INC_PR = "r47"
>>>> +INC_PR = "r48"
>>>>   # Pull in the base package for installing matrix applications
>>>>   require matrix-gui-apps.inc
>>>> -- 
>>>> 1.9.1
>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>


