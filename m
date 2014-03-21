Return-Path: <ceh@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id CD4F75208C
	for <meta-arago@arago-project.org>;
	Fri, 21 Mar 2014 14:52:11 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2LEqBPi027056
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 09:52:11 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LEqBIM021227
	for <meta-arago@arago-project.org>; Fri, 21 Mar 2014 09:52:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.174.1;
	Fri, 21 Mar 2014 09:52:10 -0500
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2LEqA4Q017885	for
	<meta-arago@arago-project.org>; Fri, 21 Mar 2014 09:52:10 -0500
Message-ID: <532C521A.8030100@ti.com>
Date: Fri, 21 Mar 2014 10:52:10 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: <meta-arago@arago-project.org>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-5-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C668606@DFLE08.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C66AAE0@DFLE08.ent.ti.com>
	<20140320183004.GA3370@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C66B25A@DFLE08.ent.ti.com>
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C66B25A@DFLE08.ent.ti.com>
Subject: Re: [tisdk-build-scripts][PATCH 4/5] linux-devtest.tgz: add new version of OpenTest CLI 13.11
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
X-List-Received-Date: Fri, 21 Mar 2014 14:52:12 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 03/21/2014 10:20 AM, Cooper Jr., Franklin wrote:
> I'm not sure what kind of changes to a TEE are required to use an updated OpenTest CLI but I guess we just need to make sure that all the TEEs upgrade together in the future before pushing updated tarballs if the naming isn't going to change.

No changes required on TEEs due to Opentest CLI update.

>
> Acked-by: Franklin Cooper Jr. <fcooper@ti.com>
>
> Consider this an Ack to all the other patches as well.
>
>
>> -----Original Message-----
>> From: Dmytriyenko, Denys
>> Sent: Thursday, March 20, 2014 1:30 PM
>> To: Cooper Jr., Franklin
>> Cc: meta-arago@arago-project.org
>> Subject: Re: [meta-arago] [tisdk-build-scripts][PATCH 4/5] linux-devtest.tgz:
>> add new version of OpenTest CLI 13.11
>>
>> On Thu, Mar 20, 2014 at 06:13:12PM +0000, Cooper Jr., Franklin wrote:
>>> Sorry sent this before but apparently I didn't use reply all.
>>> ________________________________________
>>> From: Cooper Jr., Franklin
>>> Sent: Tuesday, March 18, 2014 9:27 AM
>>> To: Denys Dmytriyenko
>>> Subject: RE: [meta-arago] [tisdk-build-scripts][PATCH 4/5]
>>> linux-devtest.tgz: add new version of OpenTest CLI 13.11
>>>
>>> Any reason why we need to name this linux-devtest.tgz instead of
>> opentest_cli_xxx.tar.gz?
>>> It would just make it easier to recognize what this tarball contains.
>> The main reason being this is AS IS tarball that comes directly from OpenTest
>> install. I didn't want to change it - either rename or change the new directory
>> structure. This way it should be very straightforward to update to new
>> versions in the future.
>>
>> --
>> Denys
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


