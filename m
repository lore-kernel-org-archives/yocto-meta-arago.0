Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 8A24352C88
	for <meta-arago@arago-project.org>;
	Mon,  3 May 2021 21:36:45 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 143LbFY1102877;
	Mon, 3 May 2021 16:37:15 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1620077835;
	bh=817X2XJN6/zmOl0f3Ofaius7tl4ymmT7+dvYVaDQToU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=NnZkzBVTosPFsX4FEEOQog66hnrLUATQo7dmAuKBJAQwOMhGyPWYHHONZSU26KkPz
	uJhDxk6QNfFx7HbKKdBfmWGlR1Jo1It56SWw4Cq6WDEUuUop1oiO9/IBhD8SAU0VgI
	EChp7Gixf0HkvQlDzwFLGWp4wFhuG6GQU91u4UDk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 143LbFkh085178
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 3 May 2021 16:37:15 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE104.ent.ti.com
	(157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Mon, 3 May 2021 16:37:15 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Mon, 3 May 2021 16:37:15 -0500
Received: from [10.247.25.23] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 143LbFvW098527;
	Mon, 3 May 2021 16:37:15 -0500
To: Denys Dmytriyenko <denis@denix.org>
References: <1616534107-46438-1-git-send-email-denis@denix.org>
	<20210503211256.GD21867@denix.org>
	<ee17cc62-5edd-d830-f109-6cb3179c791e@ti.com>
	<20210503213251.GE21867@denix.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <a08dd252-dcc6-62f3-8e24-250a98a5b66e@ti.com>
Date: Mon, 3 May 2021 16:37:14 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.10.0
MIME-Version: 1.0
In-Reply-To: <20210503213251.GE21867@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master][PATCH 1/4] chromium: apply bbappend with fix dynamically based on "browser-layer" presence
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
X-List-Received-Date: Mon, 03 May 2021 21:36:46 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 5/3/2021 4:32 PM, Denys Dmytriyenko wrote:
> On Mon, May 03, 2021 at 04:29:06PM -0500, Bajjuri, Praneeth wrote:
>>
>>
>> On 5/3/2021 4:12 PM, Denys Dmytriyenko wrote:
>>> Praneeth,
>>>
>>> Any plans to merge this series?
>>>
>>> Even though the config is disabled by default, it does some recipe cleanup and
>>> establishes dynamic layer dependency framework.
>>
>> Thanks for the bump, pulled to dunfell-next.
>>
>> Will sync to -master in  a day once the nightly build is done.
> 
> Thanks! Might want to pull corresponding oe-layersetup patch as well, even
> though it only adds extra comments :)

Pulled this one too.

> 
> 
>> --Praneeth
>>
>>>
>>>
>>> On Tue, Mar 23, 2021 at 05:15:04PM -0400, Denys Dmytriyenko wrote:
>>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>>
>>>> This solves the dangling bbappend warning when browser-layer is not enabled.
>>>>
>>>> As chromium still requires Python2, corresponding meta-python2 layer is required.
>>>>
>>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>>> ---
>>>>   meta-arago-distro/conf/layer.conf                                     | 4 ++++
>>>>   .../chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch     | 0
>>>>   .../recipes-browser/chromium/chromium-ozone-wayland_%.bbappend        | 0
>>>>   3 files changed, 4 insertions(+)
>>>>   rename meta-arago-distro/{ => dynamic-layers/browser-layer}/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch (100%)
>>>>   rename meta-arago-distro/{ => dynamic-layers/browser-layer}/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend (100%)
>>>>
>>>> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
>>>> index 2931bf9..9014511 100644
>>>> --- a/meta-arago-distro/conf/layer.conf
>>>> +++ b/meta-arago-distro/conf/layer.conf
>>>> @@ -24,6 +24,10 @@ LAYERRECOMMENDS_meta-arago-distro = " \
>>>>       browser-layer \
>>>>   "
>>>> +BBFILES_DYNAMIC += " \
>>>> +    browser-layer:${LAYERDIR}/dynamic-layers/browser-layer/recipes*/*/*.bbappend \
>>>> +"
>>>> +
>>>>   BB_DANGLINGAPPENDS_WARNONLY = "true"
>>>>   SIGGEN_EXCLUDE_SAFE_RECIPE_DEPS += " \
>>>> diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
>>>> similarity index 100%
>>>> rename from meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
>>>> rename to meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland/chromium-75.0.3770.80-SIOCGSTAMP.patch
>>>> diff --git a/meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend b/meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
>>>> similarity index 100%
>>>> rename from meta-arago-distro/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
>>>> rename to meta-arago-distro/dynamic-layers/browser-layer/recipes-browser/chromium/chromium-ozone-wayland_%.bbappend
>>>> -- 
>>>> 2.7.4
>>>>
>>>> _______________________________________________
>>>> meta-arago mailing list
>>>> meta-arago@arago-project.org
>>>> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
>>>>
>>>
>>
> 

