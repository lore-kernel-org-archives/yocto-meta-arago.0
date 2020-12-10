Return-Path: <paul.barker@konsulko.com>
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
	[209.85.210.68])
	by arago-project.org (Postfix) with ESMTPS id 452A2529D0
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2020 13:06:38 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id d8so4758620otq.6
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2020 05:06:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=konsulko.com; s=google;
	h=mime-version:references:in-reply-to:from:date:message-id:subject:to
	:cc; bh=iNyu+kX3aSs6l4e/SUExeaOEpiYdt8OtaXaCh+HSL+4=;
	b=jN3H3PJUKwCr1essyH/8MTQMhwfoYOe1sNVZu+PWJHJ+AuNz0Oo78aTIB3ANNQzJ2J
	JprBQ8F4LGAxXv08bLfsagDF7peTyL9pz0pbmk6dBv6OU4ZUdggBP23ZO48ZWef4sXCX
	Ke/I1XIPeozNI3yVDc18sN/RoqHGv3Qnwvgo0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:references:in-reply-to:from:date
	:message-id:subject:to:cc;
	bh=iNyu+kX3aSs6l4e/SUExeaOEpiYdt8OtaXaCh+HSL+4=;
	b=pk8I1xLGhF+5wZ8je7sMEsmMdn6rzA55iBSZg1XMfELb6WlHl+SyWdMISHH8ux2Rl+
	qG+lIsvrcFHxUaR+78YoygA8GK1ip482HqcbjYlGQ/jtwR2J5l4l3/BZrpK9slklNa07
	9KJ/pLXopHuwgI5jzsFsphXAcWvKSMvfIpHgyANvOy8HELkQUfGGb2eubNzqWCDrdZ8a
	fH85YFT5QRSnPLV4IDAxcZLflXPjv4pKLNCGOBnfNNGRSVUW1yoORD7UyhsShxfSEtYx
	4pxfiycQ8W+3TjKOEwVHBAMGg68oGCQ9a3cmRlHC6LLWDhA7kBWOeUbC2fkADHP4HsSY
	E7Hg==
X-Gm-Message-State: AOAM533tRee5UeYikEQ3pvYbJTWXyERnProjH5opqPGsMwnqUO2aB7Cv
	Zn7a49EXjiIAappH+iFhgZnMZktcgLnrc7gaoI84kw==
X-Google-Smtp-Source: ABdhPJyP1EY60ylNx/ydUrE7b95dTTQn3buCI9ktnEMeswXHGYbWcIQZ7Zan/NMRB2GfVpBxOXBIMsYf46b+nTyKGHk=
X-Received: by 2002:a9d:1725:: with SMTP id i37mr5646568ota.258.1607605592054; 
	Thu, 10 Dec 2020 05:06:32 -0800 (PST)
MIME-Version: 1.0
References: <20201209191713.22358-1-c-robey@ti.com>
In-Reply-To: <20201209191713.22358-1-c-robey@ti.com>
From: Paul Barker <pbarker@konsulko.com>
Date: Thu, 10 Dec 2020 13:06:21 +0000
Message-ID: <CAM9ZRVu+CME5iHWnuAgvNw+1vt6yLpwKjgkxDHaWk4fOpiZfrg@mail.gmail.com>
To: Caleb Robey <c-robey@ti.com>
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
X-List-Received-Date: Thu, 10 Dec 2020 13:06:38 -0000
Content-Type: text/plain; charset="UTF-8"

On Thu, 10 Dec 2020 at 12:42, Caleb Robey <c-robey@ti.com> wrote:
>
> From: a0232989 <a0232989@ti.com>
>
> ---
>  setup-host-check.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/setup-host-check.sh b/setup-host-check.sh
> index 45b4c71..a9db056 100644
> --- a/setup-host-check.sh
> +++ b/setup-host-check.sh
> @@ -43,6 +43,6 @@ if [ "$host" != "precise" -a "$host" != "trusty" -a "$host" != "xenial"  -a "$ho
>      echo "Unsupported host machine, only Ubuntu 12.04 LTS, Ubuntu 14.04 LTS, Ubuntu 16.04 LTS, and Ubuntu 18.04 LTS are supported"
>      exit 1
>  fi
> -echo "Ubuntu 12.04 LTS, Ubuntu 14.04, or Ubuntu 14.04 LTS is being used, continuing.."
> +echo "Ubuntu 12.04 LTS, Ubuntu 14.04, LTS Ubuntu 16.04 LTS, or Ubuntu 18.04 LTS is being used, continuing.."
>  echo "--------------------------------------------------------------------------------"
>  echo
> --
> 2.17.1

I don't see the file "setup-host-check.sh" in meta-ti or meta-arago.
The list of Ubuntu versions there looks very out of date as well.

Are you sure this patch is being sent to the right place?

Thanks,

-- 
Paul Barker
Konsulko Group

