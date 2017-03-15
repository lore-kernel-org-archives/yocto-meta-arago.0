Return-Path: <karthik.ramanan@ti.com>
Received: from fllnx210.ext.ti.com (fllnx210.ext.ti.com [198.47.19.17])
	by arago-project.org (Postfix) with ESMTPS id 2D4FE52979
	for <meta-arago@arago-project.org>;
	Wed, 15 Mar 2017 02:41:08 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id v2F2f84G019996
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 21:41:08 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1489545668;
	bh=Z57qFKoqyDPAdvtSXiOI6J4MwcZYwm3oq+o9lcf3Qx0=;
	h=Subject:To:References:CC:From:Date:In-Reply-To;
	b=CrSXBq3iWHXTIBUOF1TtKcew0hSsQps1vL0iV/f94LGZPbaJP6M7TNiFwVioEOCd9
	p39gu2R2slbeTtCZg0vPmEOoVyB0/7ekoUMsMM7yha/SSwSmJLii+6VeYC8D0LD4P5
	pkb2eyq8EXvkD6YZGVWDBeGFf5ZBI7NgWdNTwxjw=
Received: from dbdlxv05.itg.ti.com (dbdlxv05.itg.ti.com [172.24.171.60])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2F2f6N8018277
	for <meta-arago@arago-project.org>; Tue, 14 Mar 2017 21:41:07 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id v2F2f4rJ001190
	for <meta-arago@arago-project.org>; Wed, 15 Mar 2017 08:11:05 +0530
Received: from [172.22.218.156] (172.22.218.156) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server id 14.3.294.0;
	Wed, 15 Mar 2017 08:11:03 +0530
To: Denys Dmytriyenko <denys@ti.com>
References: <1489429904-13863-1-git-send-email-a0393906@ti.com>
	<20170314222213.GQ578@edge>
From: Karthik Ramanan <a0393906@ti.com>
Message-ID: <58C8A9B2.40606@ti.com>
Date: Wed, 15 Mar 2017 08:10:50 +0530
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
	Thunderbird/38.7.2
MIME-Version: 1.0
In-Reply-To: <20170314222213.GQ578@edge>
X-Originating-IP: [172.22.218.156]
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
X-List-Received-Date: Wed, 15 Mar 2017 02:41:08 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit

Denys,

Yes this is for morty.
May be I missed a notification on this, I'm thinking morty=master? 
Should I mention morty explicitly?


On 15-Mar-17 3:52 AM, Denys Dmytriyenko wrote:
> BTW, can this be done in a separate recipe to add additional app clients,
> instead of a patch to Weston? This is not scalable/portable at all...
I take your point.
For now, lets have this patch in this way. There have been no changes to 
the application for sometime.
If it undergoes additional changes we will explore ways of combining 
them. There is an ongoing effort to consolidate applications so we will 
include this one as well.


