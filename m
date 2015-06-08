Return-Path: <j-stiffler@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by arago-project.org (Postfix) with ESMTPS id 6D81452A83
	for <meta-arago@arago-project.org>;
	Mon,  8 Jun 2015 18:30:04 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t58IU26p019776
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:30:02 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58IU2A5005809
	for <meta-arago@arago-project.org>; Mon, 8 Jun 2015 13:30:02 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Mon, 8 Jun 2015 13:30:01 -0500
Received: from [10.218.109.201] (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id t58IU1Pu014753;
	Mon, 8 Jun 2015 13:30:01 -0500
Message-ID: <5575DF29.5030707@ti.com>
Date: Mon, 8 Jun 2015 14:30:01 -0400
From: Jacob Stiffler <j-stiffler@ti.com>
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64;
	rv:31.0) Gecko/20100101 Thunderbird/31.5.0
MIME-Version: 1.0
To: Denys Dmytriyenko <denys@ti.com>
References: <55759318.1010904@ti.com> <20150608182154.GD32398@edge>
In-Reply-To: <20150608182154.GD32398@edge>
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: meta-qt5
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
X-List-Received-Date: Mon, 08 Jun 2015 18:30:05 -0000
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit



On 6/8/2015 2:21 PM, Denys Dmytriyenko wrote:
> On Mon, Jun 08, 2015 at 09:05:28AM -0400, Jacob Stiffler wrote:
>> It appears that the meta-qt5 layer has dropped the 5.4.1 versioned
>> recipes. This means that the meta-arago bbappends no longer apply.
>>
>> I see there is a history of meta-arago using the versioned recipes,
>> but these are no longer there, and only the git based recipes
>> remain.
>>
>> I'm not sure of the impact there would be in moving the meta-arago
>> appends to the git based recipes. I'll give this a try and provide
>> an update later.
> Yeah, saw this last week, but haven't had a chance to fix it.
>
> What I'm thinking is there are 2 options:
>
> 1. Rename bbappends from 5.4.1 to git - seems to build fine locally here.
>
> 2. Lock meta-qt5 on the commit before 5.4.1 got removed - it won't get much
> better in 5.4.x branch and we are waiting for 5.5 to get better Touchscreen
> support. We can keep using meta-qt5/master in meta-arago/master, but lock
> meta-arago/daisy to 5.4.1, which is what has been tested so far. This seems
> safer for the release...
>
> Thoughts?

I agree that #2 sounds safer at this point.



