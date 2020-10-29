Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id B4AFE520EA
	for <meta-arago@arago-project.org>;
	Thu, 29 Oct 2020 19:41:42 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09TJcZrC093593;
	Thu, 29 Oct 2020 14:38:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1604000315;
	bh=WX9/Ri2kqiOAp378Itw7mI+rLDHahxYG162QYk621cU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=Wm+FJa21xF3TvOJ2cZyFHCOjwYI/XC97dm8rYXZ40mBj4j2wbUMOzuBgm8/KoxKfT
	+A5QtIXHbIDfWuCNVjCDbR9locgt6t8ia9seefCMC6fWnv0xA61+xnuM2+YY48yS2d
	hSaF53l6HVLKFiCzPluRqdMgEW6DK++rL++CQpL8=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09TJcZeY036534
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 29 Oct 2020 14:38:35 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 29 Oct 2020 14:38:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
	(157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 29 Oct 2020 14:38:35 -0500
Received: from [10.250.70.26] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09TJcY2w076355;
	Thu, 29 Oct 2020 14:38:35 -0500
To: Denys Dmytriyenko <denys@ti.com>
References: <1603927657-53672-1-git-send-email-denis@denix.org>
	<b33249a6-81c7-e308-b609-4e939bb5a8d3@ti.com>
	<20201029171541.GD15849@beryl>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <b8688f45-6b78-79a1-f6ce-0d9e5c672b71@ti.com>
Date: Thu, 29 Oct 2020 14:38:34 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201029171541.GD15849@beryl>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master][PATCH v4] websocketd: Add new recipe
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
X-List-Received-Date: Thu, 29 Oct 2020 19:41:43 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/29/20 12:15 PM, Denys Dmytriyenko wrote:
> On Thu, Oct 29, 2020 at 11:36:45AM -0500, Dan Murphy wrote:
>> Nikhil
>>
>> On 10/28/20 6:27 PM, Denys Dmytriyenko wrote:
>>> From: Nikhil Devshatwar <nikhil.nd@ti.com>
>>>
>>> websocketd is an application which allows to redirect output of
>>> command line applications via a websocket so that web pages can
>>> interact with them.
>>>
>>> This is very useful for visualizing statistics information on
>>> host machine browser.
>>>
>>> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
>>> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
>>> ---
>>> v4 - export http_proxy with explanation
>>>
>>>   .../recipes-devtools/websocketd/websocketd_0.3.1.bb    | 18 ++++++++++++++++++
>>>   1 file changed, 18 insertions(+)
>>>   create mode 100644 meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
>>>
>>> diff --git a/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
>>> new file mode 100644
>>> index 0000000..d2f3387
>>> --- /dev/null
>>> +++ b/meta-arago-extras/recipes-devtools/websocketd/websocketd_0.3.1.bb
>>> @@ -0,0 +1,18 @@
>>> +SUMMARY = "Application for routing native applications via websockets"
>>> +HOMEPAGE = "http://websocketd.com/"
>>> +LICENSE = "BSD-2-Clause"
>>> +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=a14d7befdbee1290ac5c472cd85d66f2"
>>> +
>>> +inherit go-mod
>>> +
>>> +GO_IMPORT = "github.com/joewalnes/websocketd"
>>> +
>>> +SRC_URI = "git://${GO_IMPORT}"
>>> +SRCREV = "0440211d7862dc76b5f2499d7dfcd4ef6a9c2fa2"
>>> +
>>> +# bitbake only exports proxy variables during fetching, but go handles
>>> +# module fetching on its own during compile and needs proxy settings
>>> +export http_proxy
>>> +
>>> +# Development package contains all the examples in different languages
>>> +INSANE_SKIP_${PN}-dev = "file-rdeps"
>> This looks fine to me but I think we should add the version we are checking
>> out.
>>
>> I mean this repo has not been updated in years but we should add the version
>> so we know it is v0.3.1.
> SRCREV above corresponds to v0.3.1 tag. While you could use the tag directly,
> it's not recommended and it's better to use specific commit SHA directly in
> the recipes, even if it's the same as the tag.
>
> The only benefit of using the tag in SRCREV is developer convenience.
>
> There are several drawbacks though:
>
> * tag could move, so someone else using your recipe could get a completely
> different output, not what you expected or intended
>
> * tag needs to be resolved against the origin git server on every bitbake
> parse, regardless if you have local sources cached or stored on a mirror.
> That requires network connection, proxies setup, etc. for every time you
> run bitbake. And some customers require isolated no-network builds when all
> the sources are available locally
>
> * and from integration/release perspective there's less control of the build
> and results due to the above - images, packages, sstate could change. Not an
> issue for nightly builds, but could be a major issue for reproducible releases
>
No I was suggesting just adding

PV = "v0.3.1" to the recipe. Still use the SHA but just document the version

Dan


