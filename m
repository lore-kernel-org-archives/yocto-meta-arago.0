Return-Path: <santosh.shilimkar@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 1E3DD5299B
	for <meta-arago@arago-project.org>;
	Thu, 26 Sep 2013 17:56:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id r8QHuEFN015556;
	Thu, 26 Sep 2013 12:56:14 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QHuE86020583;
	Thu, 26 Sep 2013 12:56:14 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 26 Sep 2013 12:56:14 -0500
Received: from [158.218.103.117] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id r8QHuBpw009855;
	Thu, 26 Sep 2013 12:56:12 -0500
Message-ID: <5244753B.6020609@ti.com>
From: Santosh Shilimkar <santosh.shilimkar@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:17.0) Gecko/17.0 Thunderbird/17.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <B0B361514883EA47B19C4FC8275640D125BC8137@sestoex09.enea.se>
	<20130926173626.GY14528@edge>
In-Reply-To: <20130926173626.GY14528@edge>
X-Mailman-Approved-At: Wed, 11 Dec 2013 18:45:42 +0000
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	=?ISO-8859-1?Q?Sixten_Sj=F6str=F6m_Thames?=
	<Sixten.Sjoestroem.Thames@enea.com>
Subject: Re: NO_HZ and TI MCSDK 3.8.4 kernel for Keystone 2
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
Date: Thu, 26 Sep 2013 17:56:16 -0000
X-Original-Date: Thu, 26 Sep 2013 13:56:11 -0400
X-List-Received-Date: Thu, 26 Sep 2013 17:56:16 -0000
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 8bit

On Thursday 26 September 2013 01:36 PM, Denys Dmytriyenko wrote:
> In general, you need to subscribe to the mailing list to be able to post to 
> it. But in this case, meta-arago is probably not the right list for you - are 
> you trying to build an Arago distribution that is based on OpenEmbedded and 
> the Yocto Project? If it's just the kernel question, then Santosh should be 
> able to help you or point you in the right direction. Thanks.
> 
> 
> On Wed, Sep 25, 2013 at 12:47:58PM +0000, Sixten Sjöström Thames wrote:
>> Hi,
>>
>> I'm interested in getting the CONFIG_NO_HZ_FULL kernel configuration 
>> (http://lwn.net/Articles/549580/) to work with the MCSDK kernel for Keystone 
>> 2 (http://arago-project.org/git/projects/?p=linux-keystone.git).
>>
This is planned feature of 2014 Q1 MCSDK releases.

>> Some questions: Are there any plans to rebase the Keystone 2 BSP against a 
>> newer Linux kernel version that supports NO_HZ_FULL (3.10 or later) in the 
>> near future? Are there any available patches that enable the NO_HZ_FULL 
>> configuration for the MCSDK 3.8.4 Linux kernel?
>>
No. We are switching to 3.10 kernel for upcong release in November
and the NO_HZ support will be made available on this kernel
version in Q12014 releases.

Regards,
Santosh


