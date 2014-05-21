Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id 97C6C52A6D
	for <meta-arago@arago-project.org>;
	Wed, 21 May 2014 13:58:27 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s4LDwQA4006617
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 08:58:26 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LDwQkR027620
	for <meta-arago@arago-project.org>; Wed, 21 May 2014 08:58:26 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.174.1;
	Wed, 21 May 2014 08:58:26 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s4LDwQ7C014225;
	Wed, 21 May 2014 08:58:26 -0500
Date: Wed, 21 May 2014 09:58:25 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Balasubramanian, Aparna" <aparnab@ti.com>
Message-ID: <20140521135825.GG21819@edge>
References: <1400527207-17021-1-git-send-email-Chase.Maupin@ti.com>
	<1400527207-17021-14-git-send-email-Chase.Maupin@ti.com>
	<20140519192944.GE21819@edge>
	<7D46E86EC0A8354091174257B2FED1015D02A58A@DLEE11.ent.ti.com>
	<537A6973.9000900@ti.com>
	<2A65B2F666A33943B1CA476CCB3F99FE0C36F48F@DFLE08.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <2A65B2F666A33943B1CA476CCB3F99FE0C36F48F@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
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
X-List-Received-Date: Wed, 21 May 2014 13:58:29 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, May 20, 2014 at 06:03:10AM -0400, Balasubramanian, Aparna wrote:
> Yes, I have a test case which checks whether following can be done from device under test.
> root@xxxxx-evm:/sbin# mount -t nfs -o nolock xx.xxx.xxx.xx:/tftpboot /mnt/testpoint

So, isn't that an NFS client use case?


> -----Original Message-----
> From: Hernandez, Carlos 
> Sent: Monday, May 19, 2014 3:29 PM
> To: Maupin, Chase
> Cc: Dmytriyenko, Denys; meta-arago@arago-project.org; Balasubramanian, Aparna
> Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-base-tiskd: Add base nfs-utils
> 
> On 05/19/2014 04:11 PM, Maupin, Chase wrote:
> >> -----Original Message-----
> >> >From: Dmytriyenko, Denys
> >> >Sent: Monday, May 19, 2014 2:30 PM
> >> >To: Maupin, Chase
> >> >Cc:meta-arago@arago-project.org
> >> >Subject: Re: [meta-arago] [PATCH 13/19] packagegroup-arago-base-
> >> >tiskd: Add base nfs-utils
> >> >
> >> >On Mon, May 19, 2014 at 02:20:01PM -0500, Chase Maupin wrote:
> >>> >>* Add the base nfs-utils package along with the nfs-utils-client
> >>> >>   package.
> >> >
> >> >I asked it before, but don't remember seeing the answer - what's the 
> >> >purpose?
> >> >Is there a use case for NFS server?
> > I can't find my reason now.  I'm going to remove it and do another test build.  Maybe it was just a left over artifact.
> >
> 
> +Aparna
> I believe one of the test cases is hosting a NFS server in the target.
> Of course, one could argue that it should go in the test package group instead of base-tisdk.
> 
> 

