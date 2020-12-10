Return-Path: <denis@denix.org>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id E94FE52A1E
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2020 19:06:39 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id 666CD40A03;
	Thu, 10 Dec 2020 19:06:33 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id V9HpS3mN5Izu; Thu, 10 Dec 2020 19:06:33 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id E0299409E0;
	Thu, 10 Dec 2020 19:06:27 +0000 (UTC)
Received: by mail.denix.org (Postfix, from userid 1000)
	id 87FB21744FC; Thu, 10 Dec 2020 14:06:27 -0500 (EST)
Date: Thu, 10 Dec 2020 14:06:27 -0500
From: Denys Dmytriyenko <denis@denix.org>
To: Dan Murphy <dmurphy@ti.com>
Message-ID: <20201210190627.GD19155@denix.org>
References: <20201209191713.22358-1-c-robey@ti.com>
	<CAM9ZRVu+CME5iHWnuAgvNw+1vt6yLpwKjgkxDHaWk4fOpiZfrg@mail.gmail.com>
	<a9f414e8-b430-d09c-325c-763fd058af24@ti.com>
MIME-Version: 1.0
In-Reply-To: <a9f414e8-b430-d09c-325c-763fd058af24@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org, a0232989 <a0232989@ti.com>,
	a0132237 <a0132237@ti.com>
Subject: Re: [PATCH 1/2] [meta-ti][dunfell/master][PATCH] setup-scripts - removing confusion for users when script succeeds, but does not include correct version in success message
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
X-List-Received-Date: Thu, 10 Dec 2020 19:06:41 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Thu, Dec 10, 2020 at 07:10:25AM -0600, Dan Murphy wrote:
> Paul
> 
> On 12/10/20 7:06 AM, Paul Barker wrote:
> >On Thu, 10 Dec 2020 at 12:42, Caleb Robey <c-robey@ti.com> wrote:
> >>From: a0232989 <a0232989@ti.com>
> >>
> >>---
> >>  setup-host-check.sh | 2 +-
> >>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>
> >>diff --git a/setup-host-check.sh b/setup-host-check.sh
> >>index 45b4c71..a9db056 100644
> >>--- a/setup-host-check.sh
> >>+++ b/setup-host-check.sh
> >>@@ -43,6 +43,6 @@ if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$ho
> >>      echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
> >>      exit 1
> >>  fi
> >>-echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
> >>+echo "Ubuntu 12.04 LTS, Ubuntu 14.04, LTS Ubuntu 16.04 LTS, or Ubuntu 18.04 LTS is being used, continuing.."
> >>  echo "--------------------------------------------------------------------------------"
> >>  echo
> >>--
> >>2.17.1
> >I don't see the file "setup-host-check.sh" in meta-ti or meta-arago.
> >The list of Ubuntu versions there looks very out of date as well.
> >
> >Are you sure this patch is being sent to the right place?
> 
> I asked Caleb to send it to this list.  But he forgot to add the
> target repo.
> 
> These scripts are part of this repo
> 
> http://arago-project.org/git/projects/?p=tisdk-setup-scripts.git;a=summary

The patch should not have [meta-ti] nor [dunfell/master] tags in the subject.
Instead, it should have [tisdk-setup-scripts] tag to avoid confusion.

-- 
Denys

