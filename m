Return-Path: <ceh@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 563BD52A51
	for <meta-arago@arago-project.org>;
	Mon, 19 May 2014 20:28:37 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4JKSaLY008129
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 15:28:36 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JKSaHX006066
	for <meta-arago@arago-project.org>; Mon, 19 May 2014 15:28:36 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 19 May 2014 15:28:36 -0500
Received: from [158.218.103.10] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4JKSZRN000795;
	Mon, 19 May 2014 15:28:36 -0500
Message-ID: <537A6973.9000900@ti.com>
Date: Mon, 19 May 2014 16:28:35 -0400
From: Carlos Hernandez <ceh@ti.com>
User-Agent: Mozilla/5.0 (X11; Linux i686;
	rv:17.0) Gecko/20130801 Thunderbird/17.0.8
MIME-Version: 1.0
To: "Maupin, Chase" <chase.maupin@ti.com>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-14-git-send-email-Chase.Maupin@ti.com>
	<20140519192944.GE21819@edge>
	<7D46E86EC0A8354091174257B2FED1015D02A58A@DLEE11.ent.ti.com>
In-Reply-To: <7D46E86EC0A8354091174257B2FED1015D02A58A@DLEE11.ent.ti.com>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>,
	"Balasubramanian, Aparna" <aparnab@ti.com>
Subject: Re: [PATCH 13/19] packagegroup-arago-base-tiskd: Add base nfs-utils
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
X-List-Received-Date: Mon, 19 May 2014 20:28:37 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 05/19/2014 04:11 PM, Maupin, Chase wrote:
>> -----Original Message-----
>> >From: Dmytriyenko, Denys
>> >Sent: Monday, May 19, 2014 2:30 PM
>> >To: Maupin, Chase
>> >Cc:meta-arago@arago-project.org
>> >Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-base-
>> >tiskd: Add base nfs-utils
>> >
>> >On Mon, May 19, 2014 at 02:20:01PM -0500, Chase Maupin wrote:
>>> >>* Add the base nfs-utils package along with the nfs-utils-client
>>> >>   package.
>> >
>> >I asked it before, but don't remember seeing the answer - what's
>> >the purpose?
>> >Is there a use case for NFS server?
> I can't find my reason now.  I'm going to remove it and do another test build.  Maybe it was just a left over artifact.
>

+Aparna
I believe one of the test cases is hosting a NFS server in the target.
Of course, one could argue that it should go in the test package group 
instead of base-tisdk.



