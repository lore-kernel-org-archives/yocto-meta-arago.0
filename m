Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 51B29520E4
	for <meta-arago@arago-project.org>;
	Thu, 16 Mar 2017 06:15:23 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2G6FM1A005118
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 01:15:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489644922;
	bh=iC7ti/8c79XmTcTBb9yPxBhYKFAt5T1MbQ8QF/qp2+A=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=Fl2z97viD521AlUt4QgGqISQu11iwOtJJq1a7IJwDpfUywQQvq2Nor03yQM/i0Zxu
	r0KHow81smX3oMx0QGvPk+1siAXiIzMS7ScVUncq4/SfbLctiQ4tAgt6/wbIv3h1SN
	wVQkXGxxVF6QisZI+b2oCHqBX+ojXrBAtXgja5jE=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2G6FLlY004725
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 01:15:22 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2G6FJjN029936
	for <meta-arago@arago-project.org>; Thu, 16 Mar 2017 11:45:20 +0530
Received: from [172.24.145.243] (172.24.145.243) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 16 Mar 2017 11:45:18 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1489429904-13863-1-git-send-email-a0393906@ti.com>
	<20170314222213.GQ578@edge> <58C8A9B2.40606@ti.com>
	<20170315152610.GT578@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58CA2D76.90500@ti.com>
Date: Thu, 16 Mar 2017 11:45:18 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20170315152610.GT578@edge>
X-Originating-IP: [172.24.145.243]
Cc: meta-arago@arago-project.org
Subject: Re: [master] weston: Add SoC performance monitoring utilities
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
X-List-Received-Date: Thu, 16 Mar 2017 06:15:23 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 15-Mar-17 8:56 PM, Denys Dmytriyenko wrote:
> On Wed, Mar 15, 2017 at 08:10:50AM +0530, Karthik Ramanan wrote:
>> Denys,
>>
>> Yes this is for morty.
>> May be I missed a notification on this, I'm thinking morty=master?
>> Should I mention morty explicitly?
>>
>>
>> On 15-Mar-17 3:52 AM, Denys Dmytriyenko wrote:
>>> BTW, can this be done in a separate recipe to add additional app clients,
>>> instead of a patch to Weston? This is not scalable/portable at all...
>> I take your point.
>> For now, lets have this patch in this way. There have been no
>> changes to the application for sometime.
>> If it undergoes additional changes we will explore ways of combining
>> them. There is an ongoing effort to consolidate applications so we
>> will include this one as well.
> A bit confused by your statement above...
>
> I was talking about "SoC performance monitoring utilities" added by this patch
> being Weston clients. In other words, they are just apps talking to Weston and
> hence should be in own separate code bases built by separate recipes. Not as a
> patch on top of Weston...
The "SoC performance monitoring utilities" is a weston application. At 
the time it
was developed, we reused some of the weston application utilities that 
are present
in the weston/clients folder - more specifically window.c and window.h 
utilities.
These are not libraries and not exported by Weston.

So the way it exists today, "SoC performance monitoring utilities" will 
be a weston
client and that it is the reason why it is applied to the Weston 
repository in this
manner.
> Are you saying if you don't envision any changes to these SoC monitoring apps,
> then you'll keep on carrying them as a Weston patch?
For now, yes that's the approach. This patch is an independent change to 
the
weston/clients. So it should apply to any version. But having said that, 
we will
try to explore the possibility of separating it to a different 
application without
this dependency, but that will have to be for later.


