Return-Path: <karthik.ramanan@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 8124C52007
	for <meta-arago@arago-project.org>;
	Wed, 24 Sep 2014 12:06:23 +0000 (UTC)
Received: from dbdlxv05.itg.ti.com ([172.24.171.60])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s8OC6Lqb019290
	for <meta-arago@arago-project.org>; Wed, 24 Sep 2014 07:06:22 -0500
Received: from DBDE72.ent.ti.com (dbde72.ent.ti.com [172.24.171.97])
	by dbdlxv05.itg.ti.com (8.14.3/8.13.8) with ESMTP id s8OC639P018722
	for <meta-arago@arago-project.org>; Wed, 24 Sep 2014 17:36:05 +0530
Received: from [172.24.159.120] (172.24.159.120) by DBDE72.ent.ti.com
	(172.24.171.97) with Microsoft SMTP Server (TLS) id 14.3.174.1;
	Wed, 24 Sep 2014 17:36:03 +0530
Message-ID: <5422B3AB.7040106@ti.com>
Date: Wed, 24 Sep 2014 17:36:03 +0530
From: Karthik Ramanan <a0393906@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:17.0) Gecko/20130620 Thunderbird/17.0.7
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <1411487426-31949-1-git-send-email-a0393906@ti.com>
	<1411487426-31949-5-git-send-email-a0393906@ti.com>
	<20140923155711.GL6303@edge>
In-Reply-To: <20140923155711.GL6303@edge>
X-Originating-IP: [172.24.159.120]
Cc: meta-arago@arago-project.org
Subject: Re: [for master 4/5] example-applications: Adding repository of GLSDK example applications
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
X-List-Received-Date: Wed, 24 Sep 2014 12:06:23 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 23-Sep-14 9:27 PM, Denys Dmytriyenko wrote:
> Are those specific to GLSDK or OMAP5/DRA7 platforms? If so, should we name the
> recipe differently? The git repo has more specific hierarchy -
> glsdk/example-applications, should the recipe be more specific too?
>
Denys,

We are using this git repository as a place holder for all kinds of 
tests and some of them are very dra7xx specific. So its definitely not 
possible to say its generic or even its specific to the platform. But 
for now we can say that this is GLSDK specific.

Do you have any suggestions to handle this scenario?

I can see that it has to be renamed to make it apparent that it is GLSDK 
specific.

Regards
Karthik

