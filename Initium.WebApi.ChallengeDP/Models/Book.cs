﻿// <auto-generated> This file has been auto generated by EF Core Power Tools. </auto-generated>
#nullable disable
using System;
using System.Collections.Generic;

namespace Initium.WebApi.ChallengeDP.Models;

public partial class Book
{
    public int Id { get; set; }

    public string Title { get; set; }

    public string Author { get; set; }

    public int PublishedYear { get; set; }

    public string Genre { get; set; }

    public int? UserId { get; set; }

    public virtual User User { get; set; }
}