Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id EBA2D52C54
	for <meta-arago@arago-project.org>;
	Mon, 12 Apr 2021 03:24:54 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 13C3PIMK027215;
	Sun, 11 Apr 2021 22:25:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1618197918;
	bh=1ZfMgQmPJ+9G4rWhY+Dk60MEVpT0icOSyCxt91hDjbA=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=W8wHSDF/gdCzqvVwn9+s1SnFRUd+nVoLHyBygxAOwcgUpaTN4mcl2sRBhdrKyEDq/
	H2zHTLRaVaJjEdFwJ7hruCB6Va04nkEriZCofomx3NdPo7iPec6QrusmK9zq/SoRbg
	q8LAdTMcWoJDx8jk2WdBUHZoKBi10x1b3KmT3Gao=
Received: from DFLE105.ent.ti.com (dfle105.ent.ti.com [10.64.6.26])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 13C3PISO019271
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sun, 11 Apr 2021 22:25:18 -0500
Received: from DFLE114.ent.ti.com (10.64.6.35) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Sun, 11 Apr 2021 22:25:18 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Sun, 11 Apr 2021 22:25:18 -0500
Received: from [10.250.34.117] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 13C3PIqm086180;
	Sun, 11 Apr 2021 22:25:18 -0500
To: Denys Dmytriyenko <denis@denix.org>, "Menon, Nishanth" <nm@ti.com>
References: <20210323145133.9940-1-nm@ti.com>
	<20210323164243.GM18041@denix.org> <20210403021443.GY23013@denix.org>
From: Praneeth Bajjuri <praneeth@ti.com>
Message-ID: <b172dbda-fac9-db04-fc28-f62bbaaff018@ti.com>
Date: Sun, 11 Apr 2021 22:25:18 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210403021443.GY23013@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [master][PATCH] layer.conf: Add hardknott to compatible release branches
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
X-List-Received-Date: Mon, 12 Apr 2021 03:24:55 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 4/2/21 9:14 PM, Denys Dmytriyenko wrote:
> On Tue, Mar 23, 2021 at 12:42:43PM -0400, Denys Dmytriyenko wrote:
>> On Tue, Mar 23, 2021 at 09:51:33AM -0500, Nishanth Menon wrote:
>>> This follows commit cfe3f78 ("layer.conf: add hardknott to compatible
>>> release branches") from meta-ti.
>>>
>>> While we are at it, remove old releases before dunfell as we no longer
>>> support the build of such configurations.
>>>
>>> Signed-off-by: Nishanth Menon <nm@ti.com>
>>> ---
>>>
>>> WARNING: there is a bunch of work to do to move to gatesgarth /
>>> hardknott .. https://pastebin.ubuntu.com/p/kKCqXvnDKf/
>>>
>>> but this allows us to get started, I think.
>>
>> Well, it's kind of premature to mark meta-arago as compatible yet...
>> Unlike meta-ti, which by itself builds fine with latest releases up to
>> master, meta-arago is rather dunfell-specific, unfortunately.
>>
>> Let me dust off my arago/master tree - I had bunch of fixes lined up there.
> 
> This can now be pulled in along with my fixes for meta-ti/meta-arago.

merged to master

> 
> 
>>>   meta-arago-distro/conf/layer.conf | 2 +-
>>>   meta-arago-extras/conf/layer.conf | 2 +-
>>>   2 files changed, 2 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/meta-arago-distro/conf/layer.conf b/meta-arago-distro/conf/layer.conf
>>> index 2931bf9daf4a..1fa61207fe01 100644
>>> --- a/meta-arago-distro/conf/layer.conf
>>> +++ b/meta-arago-distro/conf/layer.conf
>>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-distro"
>>>   BBFILE_PATTERN_meta-arago-distro := "^${LAYERDIR}/"
>>>   BBFILE_PRIORITY_meta-arago-distro = "10"
>>>   
>>> -LAYERSERIES_COMPAT_meta-arago-distro = "sumo thud warrior zeus dunfell"
>>> +LAYERSERIES_COMPAT_meta-arago-distro = "dunfell gatesgarth hardknott"
>>>   
>>>   LAYERDEPENDS_meta-arago-distro = " \
>>>       core \
>>> diff --git a/meta-arago-extras/conf/layer.conf b/meta-arago-extras/conf/layer.conf
>>> index 7e3081b20ba8..d64a80f8890f 100644
>>> --- a/meta-arago-extras/conf/layer.conf
>>> +++ b/meta-arago-extras/conf/layer.conf
>>> @@ -8,7 +8,7 @@ BBFILE_COLLECTIONS += "meta-arago-extras"
>>>   BBFILE_PATTERN_meta-arago-extras := "^${LAYERDIR}/"
>>>   BBFILE_PRIORITY_meta-arago-extras = "10"
>>>   
>>> -LAYERSERIES_COMPAT_meta-arago-extras = "sumo thud warrior zeus dunfell"
>>> +LAYERSERIES_COMPAT_meta-arago-extras = "dunfell gatesgarth hardknott"
>>>   
>>>   # Set a variable to get to the top of the metadata location
>>>   ARAGOBASE := '${@os.path.normpath("${LAYERDIR}/../")}'
>>> -- 
>>> 2.31.0
>>>
> 

