Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by arago-project.org (Postfix) with ESMTPS id C6C6B52A7D
	for <meta-arago@arago-project.org>;
	Wed,  2 Mar 2016 15:53:12 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u22FrCTN026218;
	Wed, 2 Mar 2016 09:53:12 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22FrCY4015913;
	Wed, 2 Mar 2016 09:53:12 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 2 Mar 2016 09:53:12 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u22FrBMo008559;
	Wed, 2 Mar 2016 09:53:11 -0600
Date: Wed, 2 Mar 2016 10:52:55 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Tim Orling <ticotimo@gmail.com>
Message-ID: <20160302155255.GE7505@edge>
References: <A78912DB-197C-4868-971C-25C34F2578BF@gmail.com>
MIME-Version: 1.0
In-Reply-To: <A78912DB-197C-4868-971C-25C34F2578BF@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: Plans for jethro?
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
X-List-Received-Date: Wed, 02 Mar 2016 15:53:13 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 29, 2016 at 07:46:29PM -0800, Tim Orling wrote:
> New to the list; curious if there is a planned schedule for a jethro branch?
> 
> I have some Beagleboard related trees that would appreciate a jethro update :)

Hi, Tim, long time no see!

I just had to answer the same question recently on meta-ti list:

https://lists.yoctoproject.org/pipermail/meta-ti/2016-February/008064.html

"As you can see, we skipped dizzy and jethro releases, as we don't have 
resources to maintain 2 releases per year. I try to keep master up to date and 
we plan to intersect the next 2.1 release in April, for which we'll have a new 
branch in meta-ti."

If you are asking about meta-arago, then the answer is the same, except master 
is currently compatible with Fido, and I will be migrating it to the latest 
code in coming weeks to work with upcoming 2.1 release.

-- 
Denys

